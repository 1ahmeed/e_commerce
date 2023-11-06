import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant.dart';
import '../../core/local_data.dart';
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
   Future.delayed(const Duration(seconds: 2),(){

     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
       bool? onBoarding = CacheNetwork.getData(key:"onBoarding");

       if (onBoarding != null) {
         if (token != null) {
           return LayoutScreen();
         } else {
            return LoginScreen();
         }
       }else{
         return const  OnBoardingScreen();
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
          Expanded(child: Center(child: SvgPicture.asset("images/logo.svg"))),

          const Text("Made by ahmed tarek",style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}
