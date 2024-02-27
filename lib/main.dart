import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/modelview/cubit_cart/cart_model_view_cubit.dart';
import 'package:shop_app/modelview/cubit_fav/fav_model_view_cubit.dart';
import 'package:shop_app/modelview/cubit_tabs/tabs_view_cubit.dart';
import 'package:shop_app/view/screens/auth_screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TabsViewCubit(),
          ),
          BlocProvider(
            create: (context) => FavModelViewCubit(),
          ),
          BlocProvider(
            create: (context) => CartModelViewCubit(),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LoginScreen(),
          ),
        ));
  }
}
