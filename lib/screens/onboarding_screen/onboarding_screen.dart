import 'package:e_commerce/core/local_data.dart';
import 'package:e_commerce/screens/auth_screen/login_screen.dart';
import 'package:e_commerce/widgets/build_boarding_item.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/component/custom_navigation_and_finish.dart';
import '../../models/on_boarding/on_boarding_model.dart';




class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/board1.jpg',
      title: 'Fashion',
      body: 'Let\'s go shopping',
    ),
    BoardingModel(
      image: 'images/board2.jpg',
      title: 'Fashion',
      body: 'See Special Offers',
    ),
    BoardingModel(
      image: 'images/board3.jpg',
      title: 'Fashion',
      body: 'Choose Favourite Product',
    ),
  ];

  bool isLast = false;
  var boardController = PageController();
   void submit(){
     CacheNetwork.insertIntoCache(
         key: 'onBoarding',
         value: true).then((value){
       if(value==true){
         navigatorAndFinish(context, LoginScreen());
       }

     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              submit();
              },
          child:const  Text("SKIP",
        style: TextStyle(fontSize: 18,color:AppColor.mainColor),)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics:const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },

                itemBuilder: (context, index) =>
                    BuildBoardingItem(boardingModel:boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                        width: 32,
                        height: 12,
                        color: AppColor.mainColor,
                        rotationAngle: 180,
                        verticalOffset: -10,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      activeDotDecoration: DotDecoration(
                        width: 24,
                        height: 12,
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                        verticalOffset: 0,
                      ),
                      spacing: 6.0,
                    ),
                    controller: boardController,
                    count: boarding.length),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: AppColor.mainColor,
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child:const Icon(Icons.arrow_forward_ios,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
