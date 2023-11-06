import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/carts/cart_model.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildCartItem extends StatelessWidget {
   const BuildCartItem({Key? key, required this.cartItems,})
      : super(key: key);
   final CartItems? cartItems;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CachedNetworkImage(
                    width: 100,
                    height: 130,
                    imageUrl: cartItems!.product!.image.toString(),
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                  if (cartItems!.product!.discount != 0 &&
                      cartItems!.product!.discount !=
                          cartItems!.product!.price)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: const Text(
                        "DISCOUNT",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItems!.product!.name!,
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
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "${cartItems!.product!.price!} \$",
                              style: const TextStyle(fontSize: 13),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        if (cartItems!.product!.discount != 0 &&
                            cartItems!.product!.discount !=
                                cartItems!.product!.price)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "${cartItems!.product!.oldPrice!} \$",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.5,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        OutlinedButton(onPressed: (){
                          HomeCubit.get(context)!.addOrRemoveFromFavourite(
                              productId:cartItems!.product!.id!);
                        },
                            child:HomeCubit.get(context)!.favouritesId[cartItems!.product!.id]! ?
                            const Icon(Icons.favorite_outlined,color: Colors.red,):
                            const Icon(Icons.favorite_border_outlined,color: Colors.grey,)
                        ),

                        const Spacer(),
                        MaterialButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {
                            // Add | remove product favorites
                            HomeCubit.get(context)!.addOrRemoveFromCart(productId:cartItems!.product!.id!);
                          },
                          child: const Text("Remove"),
                        )
                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        );
      },
    );
  }
}
