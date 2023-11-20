import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product/products_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productsData})
      : super(key: key);
  final ProductsData? productsData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: mainColor,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text("Details"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 50,),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            CachedNetworkImage(
                              width: 250,

                              height: 250,
                              imageUrl: productsData!.image.toString(),
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline),
                              placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                            ),
                            if (productsData!.discount != 0 &&
                                productsData!.discount != productsData!.price)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                color: Colors.red,
                                child: const Text(
                                  "DISCOUNT",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${productsData!.price!} \$",
                                style: const TextStyle(fontSize: 25),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          if (productsData!.discount != 0 &&
                              productsData!.discount != productsData!.price)
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${productsData!.oldPrice!} \$",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 25,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        productsData!.name!,
                        maxLines: 5,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        productsData!.description!,
                        maxLines: 50,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis),
                      ),

                      // Expanded(
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: double.infinity,
                      //     decoration: const BoxDecoration(
                      //         color: mainColor,
                      //       borderRadius: BorderRadius.only(
                      //           topLeft:Radius.circular(25) ,topRight:Radius.circular(25) )
                      //     ),
                      //     child: Padding(
                      //       padding:  const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                      //       child: SingleChildScrollView(
                      //         child: Column(
                      //           children: [
                      //             Text(
                      //               productsData!.name!,
                      //               maxLines: 3,
                      //               style: const TextStyle(
                      //                 color: Colors.white,
                      //                    fontWeight: FontWeight.bold,
                      //                   fontSize: 20,
                      //                   overflow: TextOverflow.ellipsis),
                      //             ),
                      //             const SizedBox(height: 15,),
                      //
                      //             Text(
                      //               productsData!.description!,
                      //               maxLines: 50,
                      //               style: const TextStyle(
                      //                 color: Colors.white,
                      //                   fontSize: 18,
                      //                   overflow: TextOverflow.ellipsis),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(onPressed: (){
                      HomeCubit.get(context)!.addOrRemoveFromFavourite(
                          productId:productsData!.id!);
                    },
                        child:HomeCubit.get(context)!.favouritesId[productsData!.id]! ?
                        const Icon(Icons.favorite_outlined,color: Colors.red,):
                        const Icon(Icons.favorite_border_outlined,color: Colors.grey,)
                    ),

                    OutlinedButton(onPressed: (){
                      HomeCubit.get(context)!.addOrRemoveFromCart(productId:productsData!.id!);

                    },
                        child:HomeCubit.get(context)!.cartsId[productsData!.id]! ?
                        const Icon(Icons.shopping_cart,color: Colors.green,):
                        const Icon(Icons.shopping_cart,color: Colors.grey,)
                    ),

                  ],
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        );
      },
    );
  }
}
