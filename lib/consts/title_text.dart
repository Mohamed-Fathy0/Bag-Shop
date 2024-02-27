import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bag Shop',
      style: TextStyle(
          fontSize: 30.sp,
          color: Colors.cyan[600],
          fontWeight: FontWeight.w600),
    );
  }
}
