
import 'package:e_commerce/widgets/build_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/colors.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/home_cubit/home_state.dart';
import '../../localization/generated/l10n.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title:  Text(S.of(context).yourOrder),
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColor.mainColor,
            ),
            body: HomeCubit.get(context)!.orderModel != null ?
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                          const SizedBox(height: 20,),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (HomeCubit.get(context)!.orderModel!.data!
                                .data![index].total == 0) {
                              return null;
                            } else {
                              return BuildOrderItem(
                                  index: index,
                                  dataOfOrder: HomeCubit.get(context)!
                                      .orderModel!.data!.data![index]);
                            }
                          },

                          itemCount: HomeCubit.get(context)!.orderModel!.data!
                              .data!.length,
                        ),
                      ),

                    ],
                  )
              ),
            ) :
            const Center(child: CircularProgressIndicator(),)

        );
      },
    );
  }
}
