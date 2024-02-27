import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultButton({
  required Function() onPressed,
  Widget? child,
}) =>
    MaterialButton(
      onPressed: onPressed,
      highlightColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0.w,
        vertical: 7.5.h,
      ),
      color: Colors.teal,
      child: child,
    );
