import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/bag_model.dart';
import 'package:shop_app/models/dummy_data/bags.dart';
import 'package:shop_app/modelview/cubit_cart/cart_model_view_cubit.dart';
import 'package:shop_app/modelview/cubit_fav/fav_model_view_cubit.dart';
import 'package:shop_app/view/widgets/my_carousel_slider.dart';
import 'package:shop_app/view/widgets/my_searchbar.dart';
import 'package:shop_app/view/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
          width: MediaQuery.of(context).size.width - 50,
          child: const MySearchBar(),
        ),
      ),
      body: BlocBuilder<FavModelViewCubit, FavModelViewState>(
        builder: (context, state) {
          final favCubit = BlocProvider.of<FavModelViewCubit>(context);
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: MyCarouselSlider(),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 0.7,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final BagModel bag = bags[index];
                      return Stack(
                        children: [
                          ProductCard(bag: bag),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              onPressed: () {
                                favCubit.changeFav(bag.id);
                              },
                              icon: Icon(
                                favCubit.favStatus[bag.id] == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 24.0,
                              ),
                            ),
                          ),
                          BlocBuilder<CartModelViewCubit, CartModelViewState>(
                            builder: (context, state) {
                              final cartCubit =
                                  BlocProvider.of<CartModelViewCubit>(context);
                              return Positioned(
                                bottom: 8,
                                right: 8,
                                child: IconButton(
                                    onPressed: () {
                                      cartCubit.changeCart(bag.id);
                                    },
                                    icon: Icon(
                                      Icons.add_shopping_cart,
                                      color:
                                          cartCubit.cartStatus[bag.id] == true
                                              ? Colors.green
                                              : Colors.grey,
                                    )),
                              );
                            },
                          ),
                        ],
                      );
                    },
                    childCount: bags.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
