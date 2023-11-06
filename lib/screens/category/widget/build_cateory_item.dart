import 'package:e_commerce/models/categories/category_data.dart';
import 'package:flutter/material.dart';

class BuildCategoryItem extends  StatelessWidget {
  const BuildCategoryItem({Key? key,this.categoryData}) : super(key: key);
final CategoryData? categoryData;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Expanded(child: Image.network(categoryData!.image!)),
           const SizedBox(height: 10,),
           Text(categoryData!.name!)
        ],
      ),
    );
  }
}
