import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product/products_data.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:e_commerce/screens/home/product_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BuildProductItems extends StatelessWidget {
  const BuildProductItems({
    super.key,
    this.productsData,
  });

  final ProductsData? productsData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [

              InkWell(
                onTap: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                    productsData: productsData,
                  ),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,

                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            CachedNetworkImage(
                              width: 300,
                              height: double.infinity,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        productsData!.name!,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "${productsData!.price!} \$",
                                      style: const TextStyle(fontSize: 13),
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
                                          fontSize: 12.5,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          InkWell(
                            child:
                            HomeCubit.get(context)!
                                .favouritesId[productsData!.id]!
                                ? const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red
                            )
                                : const Icon(
                              Icons.favorite_border,
                              size: 25,
                              color: Colors.grey,
                            ),

                            onTap: () {
                              // Add | remove product favorites
                              HomeCubit.get(context)!.addOrRemoveFromFavourite(
                                  productId: productsData!.id!);
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -15,
                child: InkWell(
                  onTap: () {

                    HomeCubit.get(context)!.addOrRemoveFromCart(productId: productsData!.id!);

                  },
                  child:  CircleAvatar(
                    radius: 20,
                    backgroundColor: HomeCubit.get(context)!.cartsId[productsData!.id]!?
                    Colors.green:Colors.black38,
                    child: const Icon(Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
