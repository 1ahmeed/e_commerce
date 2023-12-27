import 'package:e_commerce/widgets/build_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/home_cubit/home_state.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: HomeCubit.get(context)!.favouriteModel != null
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: HomeCubit.get(context)!
                              .favouriteModel!
                              .data!
                              .data!
                              .length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 0,
                          ),
                          itemBuilder: (context, index) => BuildFavouriteItem(
                            model: HomeCubit.get(context)!
                                .favouriteModel!
                                .data!
                                .data![index],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
