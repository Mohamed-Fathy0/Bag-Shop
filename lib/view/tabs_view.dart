import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/dummy_data/bags.dart';
import 'package:shop_app/modelview/cubit_tabs/tabs_view_cubit.dart';
import 'package:shop_app/view/screens/cart_screen.dart';
import 'package:shop_app/view/screens/favorite_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/settings_screen.dart';
import 'package:shop_app/view/widgets/bottom_navigationbar.dart';

class TabsView extends StatelessWidget {
  const TabsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      const HomeScreen(),
      const FavoriteScreen(),
      CartScreen(cartItems: bagsCart),
      const SettingsScreen(),
    ];

    return BlocBuilder<TabsViewCubit, TabsViewState>(
      builder: (context, currentIndex) {
        return Scaffold(
          bottomNavigationBar: const MyBottomNavigationBar(),
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: body[BlocProvider.of<TabsViewCubit>(context).getIndex()]),
        );
      },
    );
  }
}
