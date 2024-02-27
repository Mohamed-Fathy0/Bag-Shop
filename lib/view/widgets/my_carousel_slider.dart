import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/models/bag_model.dart';
import 'package:shop_app/models/dummy_data/bags.dart';
import 'package:shop_app/view/widgets/product_card.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        enlargeCenterPage: true,
        height: 280.h,
      ),
      itemCount: bags.length,
      itemBuilder: (
        BuildContext context,
        int itemIndex,
        int pageViewIndex,
      ) {
        final BagModel bag = bags[itemIndex];
        return ProductCard(bag: bag);
      },
    );
  }
}
