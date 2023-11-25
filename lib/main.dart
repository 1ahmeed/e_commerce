import 'package:e_commerce/core/local_data.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth_screen/login_screen.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/layout/cubit/layout_cubit.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:e_commerce/screens/profile/cubit/profile_cubit.dart';
import 'package:e_commerce/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block_observer.dart';
import 'core/constant.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheNetwork.init();
  token =CacheNetwork.getData(key:"token" );
  currentPassword =CacheNetwork.getData(key:"password" );
  // print("new token is $token");
  // print("current password is $currentPassword");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => LayoutCubit(),),
        BlocProvider( create: (context) => ProfileCubit()..getUserData(),),
        BlocProvider(create: (context) =>HomeCubit()..getBanners()..getCategories()
          ..getProducts()..getFavourites()..getCarts(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen()
      ),
    );
  }
}

