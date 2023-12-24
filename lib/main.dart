import 'package:e_commerce/core/local_data.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_state.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/layout/cubit/layout_cubit.dart';
import 'package:e_commerce/screens/layout/cubit/layout_state.dart';
import 'package:e_commerce/screens/profile/cubit/profile_cubit.dart';
import 'package:e_commerce/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'block_observer.dart';
import 'core/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheNetwork.init();
  token = CacheNetwork.getData(key: "token");
  currentPassword = CacheNetwork.getData(key: "password");
  bool? isArabic = CacheNetwork.getData(key: "isArabic");

  runApp(MyApp(isArabic: isArabic));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isArabic});

  final bool? isArabic;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit() ..changeLang(fromShared: isArabic),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            ..getBanners()
            ..getCategories()
            ..getProducts()
            ..getFavourites()
            ..getCarts()
            ..getAddresses()
            ..getOrders()

        ),
      ],
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
              locale: LayoutCubit.get(context)!.isArabic
                  ? const Locale("en")
                  : const Locale("ar"),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen());
        },
      ),
    );
  }
}
