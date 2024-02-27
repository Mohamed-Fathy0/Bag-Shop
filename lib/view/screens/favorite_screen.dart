import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/bag_model.dart';
import 'package:shop_app/models/dummy_data/bags.dart';
import 'package:shop_app/modelview/cubit_fav/fav_model_view_cubit.dart';
import 'package:shop_app/view/widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavModelViewCubit, FavModelViewState>(
        builder: (context, state) {
          final favCubit = BlocProvider.of<FavModelViewCubit>(context);
          return GridView.builder(
            itemCount: bagsFav.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final BagModel bagFav = bagsFav[index];

              return Stack(
                children: [
                  ProductCard(bag: bagFav),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () {
                        favCubit.changeFav(bagFav.id);
                      },
                      icon: Icon(
                        favCubit.favStatus[bagFav.id] == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
