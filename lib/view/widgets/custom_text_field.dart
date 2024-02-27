import 'package:flutter/material.dart';

Widget defaultTFF({
  TextEditingController? controller,
  FocusNode? focusNode,
  TextInputType? keyboardType,
  required String text,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function()? onPressedSuffix,
  String? Function(String?)? validate,
  bool isObscure = false,
  Function()? onTap,
  Function(String)? onSubmit,
}) {
  return TextFormField(
    controller: controller,
    onTap: onTap,
    onFieldSubmitted: onSubmit,
    focusNode: focusNode,
    keyboardType: keyboardType,
    obscureText: isObscure,
    maxLines: 1,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      hintText: text,
      hintStyle: const TextStyle(
        color: Colors.black38,
        fontSize: 16.0,
      ),
      filled: true,
      fillColor: Colors.white24,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Icon(
          prefixIcon,
          color: Colors.black54,
          size: 24.0,
        ),
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: onPressedSuffix,
              icon: Icon(suffixIcon),
              color: Colors.black54,
            ),
          ),
        ),
      ),
    ),
    validator: validate,
  );
}
