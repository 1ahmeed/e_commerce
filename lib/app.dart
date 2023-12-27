import 'package:e_commerce/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/local_data.dart';
import 'core/utils/themes.dart';
import 'cubit/auth_cubit/auth_cubit.dart';
import 'cubit/home_cubit/home_cubit.dart';
import 'cubit/layout_cubit/layout_cubit.dart';
import 'cubit/layout_cubit/layout_state.dart';
import 'cubit/profile_cubit/profile_cubit.dart';
import 'localization/generated/l10n.dart';


class MyApp extends StatelessWidget {
   MyApp._internal();
 final bool? isArabic = CacheNetwork.getData(key: "isArabic");
  final bool? isDark = CacheNetwork.getData(key: "isDark");
  static  final MyApp _instance =  MyApp._internal(); //singleton
   factory MyApp()=> _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit()..changeLang(fromShared: isArabic)..changeMode(
              fromShared: isDark
          ),
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
              theme:AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode:LayoutCubit.get(context)!.isDark ?ThemeMode.light:ThemeMode.dark ,
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