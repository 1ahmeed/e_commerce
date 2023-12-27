import 'package:e_commerce/widgets/build_cateory_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/home_cubit/home_state.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              itemCount: HomeCubit.get(context)!.categoryData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2 ,
                  mainAxisSpacing:25 ,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) => BuildCategoryItem(categoryData:
                HomeCubit.get(context)!.categoryData[index]
                ),),
          )
        );
      },
    );
  }
}
