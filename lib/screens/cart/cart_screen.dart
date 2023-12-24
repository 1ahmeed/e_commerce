
import 'package:e_commerce/screens/cart/widget/build_cart_item.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import 'order_address_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: HomeCubit.get(context)!.cartModel !=null?
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: HomeCubit.get(context)!.cartModel!.data!.cartItems!.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 0,
                    ),
                    itemBuilder: (context, index) => BuildCartItem(
                      cartItems:
                      HomeCubit.get(context)!.cartModel!.data!.cartItems![index],
                    ),
                  )

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(S.of(context).total, style: const TextStyle(color:  Colors.black,fontSize: 20),),
                    Text(
                      "${HomeCubit.get(context)!.total.toString()}\$",style: const TextStyle(color:  Colors.black,fontSize: 20),),
                  ],
                ),
                const SizedBox(height: 20,),
                if(HomeCubit.get(context)!.cartModel!.data!.cartItems!.isNotEmpty)
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  OrderAddressScreen(),));

                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: mainColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(S.of(context).buyNow, style: const TextStyle(color:  Colors.white,fontSize: 20),),
                        ],
                      )),
                ),


              ],
            ),
          ):const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
