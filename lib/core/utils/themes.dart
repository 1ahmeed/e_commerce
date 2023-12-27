import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


class AppTheme{
 static ThemeData lightTheme = ThemeData(
    // primarySwatch:,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.mainColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: AppColor.mainColor,
        ),
        bodySmall: TextStyle(
          color: Colors.grey,
          fontSize: 15
      ),
      bodyMedium:  TextStyle(
          color: Colors.black87,
          fontSize: 15
      )

    ),
   iconTheme: const IconThemeData(
     color: Colors.grey
   )
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    // primarySwatch: Colors.green,
    // backgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor('333739'),
      titleSpacing: 20.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: HexColor('333739'),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: HexColor('333739'),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 15
      ),
        bodyMedium:  TextStyle(
            color: Colors.white,
            fontSize: 15
        )
    ),

      iconTheme: const IconThemeData(
          color: Colors.white
      )
  );
}

