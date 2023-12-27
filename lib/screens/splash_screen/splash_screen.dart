
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant.dart';
import '../../core/local_data.dart';
import '../../core/utils/colors.dart';
import '../../cubit/layout_cubit/layout_cubit.dart';
import '../auth_screen/login_screen.dart';
import '../layout/layout_screen.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        bool? onBoarding = CacheNetwork.getData(key: "onBoarding");

        if (onBoarding != null) {
          if (token != null) {
            return LayoutScreen();
          } else {
            return LoginScreen();
          }
        } else {
          return const OnBoardingScreen();
        }
      }
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: Expanded(child: Center(
                  child: SvgPicture.asset("images/logo.svg",
                     colorFilter: ColorFilter.mode(
                      LayoutCubit.get(context)!.isDark?AppColor.mainColor:AppColor.white,
                  BlendMode.srcIn), )
              ))),

            Text(
           "Made by ahmed tarek", style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),)
        ],
      ),
    );
  }
}
