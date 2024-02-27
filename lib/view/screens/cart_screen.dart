import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/bag_model.dart';
import 'package:shop_app/modelview/cubit_cart/cart_model_view_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.cartItems});

  final List<BagModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartModelViewCubit, CartModelViewState>(
        builder: (context, state) {
          final cartCubit = BlocProvider.of<CartModelViewCubit>(context);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    final itemNumber = cartCubit.getItemNumber(cartItem.id);
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: Image.asset(
                          cartItem.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          cartItem.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    cartCubit.decrementItems(cartItem.id);
                                  },
                                ),
                                Text(
                                  '$itemNumber',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    cartCubit.incrementItems(cartItem.id);
                                  },
                                ),
                              ],
                            ),
                            Text(
                              '\$${(cartItem.price * itemNumber).toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            cartCubit.removeCart(cartItem.id);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '\$${calculateTotal(cartItems, cartCubit)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ), // Use teal color
                      ),
                      child: const Text(
                        'Check out',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String calculateTotal(
      List<BagModel> cartItems, CartModelViewCubit cartCubit) {
    double total = 0;
    for (final cartItem in cartItems) {
      final itemNumber = cartCubit.getItemNumber(cartItem.id);
      total += cartItem.price * itemNumber;
    }
    return total.toStringAsFixed(2);
  }
}
