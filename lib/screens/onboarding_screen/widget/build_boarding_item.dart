import 'package:flutter/material.dart';

import '../../../models/on_boarding/on_boarding_model.dart';


class BuildBoardingItem extends  StatelessWidget {
  const BuildBoardingItem({super.key,
    this.boardingModel
  });
  final BoardingModel? boardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Expanded(child: Image(image: AssetImage(boardingModel!.image))),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              boardingModel!.title,
              style:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              boardingModel!.body,
              style:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
