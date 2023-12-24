import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/favourites/favourite_model.dart';

import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../home/cubit/home_cubit.dart';

class BuildFavouriteItem extends StatelessWidget {
  const BuildFavouriteItem({Key? key, this.model})
      : super(key: key);
  final FavouritesData? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
                    imageUrl: model!.product!.image.toString(),
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                  if (model!.product!.discount != 0 &&
                      model!.product!.discount !=
                          model!.product!.price)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child:  Text(
                        S.of(context).discount,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
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
                      model!.product!.name!,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "${model!.product!.price!} \$",
                              style: const TextStyle(fontSize: 13),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        if (model!.product!.discount != 0 &&
                            model!.product!.discount !=
                                model!.product!.price)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "${model!.product!.oldPrice!} \$",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.5,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        // Add | remove product favorites
                        HomeCubit.get(context)!.addOrRemoveFromFavourite(
                            productId: model!.product!.id);
                        // cubit.addOrRemoveFromFavorites(productID: model.id.toString());
                      },
                      child:  Text(S.of(context).remove),
                    )
                  ],
                ),
              ),

              // Row(
              //   children:
              //   [
              //     Expanded(
              //       child: Row(
              //         children:
              //         [
              //           FittedBox(fit:BoxFit.scaleDown,child: Text("${productFavouriteData!.price!} \$",style:const  TextStyle(fontSize:13),)),
              //           const SizedBox(width: 5,),
              //           if (productFavouriteData!.discount != 0 && productFavouriteData!.discount !=productFavouriteData!.price )
              //             FittedBox(
              //               fit: BoxFit.scaleDown,
              //               child: Text("${productFavouriteData!.oldPrice!} \$",style:const  TextStyle(color:Colors.grey,fontSize: 12.5,decoration: TextDecoration.lineThrough),),)
              //         ],
              //       ),
              //     ),
              //     GestureDetector(
              //       child: Icon(
              //         Icons.favorite_border,
              //         size: 20,
              //         // color: cubit.favoritesID.contains(model.id.toString())? Colors.red : Colors.grey,
              //       ),
              //       onTap: ()
              //       {
              //         // Add | remove product favorites
              //         // cubit.addOrRemoveFromFavorites(productID: model.id.toString());
              //       },
              //     )
              //   ],
              // )
            ],
          ),
        );
      },
    );
  }
}
