import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/consts/title_text.dart';
import 'package:shop_app/view/widgets/custom_button.dart';
import 'package:shop_app/view/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TitleText()),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 36.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0.h),
                defaultTFF(
                  controller: nameController,
                  text: 'Name',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.person,
                  validate: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0.h),
                defaultTFF(
                  controller: emailController,
                  text: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.alternate_email,
                  validate: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0.h),
                defaultTFF(
                  controller: passwordController,
                  isObscure: true,
                  text: 'Password',
                  prefixIcon: Icons.lock_outline_rounded,
                  suffixIcon: Icons.visibility,
                  onPressedSuffix: () {},
                  validate: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0.h),
                defaultTFF(
                  controller: phoneController,
                  text: 'Phone',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone,
                  validate: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    defaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Perform sign up operation
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0.sp,
                            ),
                          ),
                          SizedBox(width: 5.0.w),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24.0.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
