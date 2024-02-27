import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/consts/title_text.dart';

import 'package:shop_app/view/screens/auth_screens/sign_up.dart';
import 'package:shop_app/view/tabs_view.dart';
import 'package:shop_app/view/widgets/custom_button.dart';
import 'package:shop_app/view/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const TitleText(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabsView(),
                    ));
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/bag_auth.svg",
                  fit: BoxFit.contain,
                  height: 200,
                  colorFilter:
                      const ColorFilter.mode(Colors.cyan, BlendMode.srcIn),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 36.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                // Email Field
                defaultTFF(
                  controller: emailController,
                  text: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.alternate_email,
                  validate: (value) {
                    if (value != null && value == '') {
                      return 'Please, Enter an Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                // Password Field
                defaultTFF(
                  controller: passwordController,
                  isObscure: true,
                  text: 'Password',
                  prefixIcon: Icons.lock_outline_rounded,
                  validate: (value) {
                    if (value != null && value == '') {
                      return 'Please, Enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.0.h,
                ),
                // Login Button
                defaultButton(
                  onPressed: () {
                    //     if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabsView(),
                      ),
                    );
                    // Perform login operation
                    //         }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24.0.sp,
                      ),
                    ],
                  ),
                ),
                // Signup Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 14.0.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.cyan,
                          fontSize: 14.0.sp,
                        ),
                      ),
                    )
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
