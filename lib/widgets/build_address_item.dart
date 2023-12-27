import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/models/address/address_model.dart';
import 'package:e_commerce/screens/cart/edit_address_screen.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../core/utils/dialog_utils.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../localization/generated/l10n.dart';

class BuildAddressItem  extends StatelessWidget {
   BuildAddressItem({Key? key,this.index,this.dataOfAddress}) : super(key: key);
    final DataOfAddress? dataOfAddress;
   final int? index;

  final List colors = [
    HexColor('#AED6F1'),
    HexColor('#A3E4D7'),
    HexColor('#c4a7e7'),
    HexColor('#FADBD8'),
    HexColor('#F9E79F'),
    HexColor('#D6DBDF'),
    HexColor('#FFBF00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            DialogUtils.showWidget(context,
                  SizedBox(
                   height: 150,
                   width: 100,
                   child: Column(
              children: [
                Row(
                    children: [
                      Text(S.of(context).warningInChooseAddress,
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                ),
                const SizedBox(
                    height: 30.0,
                ),
                 Row(
                    children: [
                      Text(S.of(context).howToPay,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                ),

              ],
            ),
                 ),

                posActionTitle: S.of(context).cash,
                posAction: ()async{
                  DialogUtils.showLoading(context, "Loading...");
                  await  HomeCubit.get(context)!.makeOrder(
                  addressId: dataOfAddress!.id!,
                  payMethod: 1);
                  DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                 S.of(context).successOrderCache,
                  posActionTitle: "ok",
                  posAction: ()async{
                    // await HomeCubit.get(context)!.getOrders();
                   await HomeCubit.get(context)!.getCarts();

                    Navigator.pop(context);
                  }
                  );


                },
              negActionTitle: S.of(context).online,
              negAction:()async{
                DialogUtils.showLoading(context, "Loading...");
                await HomeCubit.get(context)!.makeOrder(
                    addressId: dataOfAddress!.id!,
                    payMethod: 2);
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(context,
                    S.of(context).successOrderOnline,
                    posActionTitle: "ok",
                    posAction: (){
                      HomeCubit.get(context)!.getCarts();

                      Navigator.pop(context);
                    }


                );
              } ,

            );
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colors[index! % colors.length],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height:15 ,),
                  ///اسم العميل
                  Row(
                    children: [
                       Text(S.of(context).clientName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        dataOfAddress!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///المدينه
                  Row(
                    children: [
                       Text(
                       S.of(context).cityName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                      Text(
                       dataOfAddress!.city! ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///المنطقه
                   Row(
                    children: [
                       Text(
                        "${S.of(context).region} :  ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                      Text(
                        dataOfAddress!.region! ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///التفاصيل
                  Row(
                    children: [
                       Text(
                        '${S.of(context).details} :  ' ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                      Text(
                        dataOfAddress!.details! ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///اي ملاحظات
                  Row(
                    children: [
                       Text(
                        '${S.of(context).note} :  ' ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                      Text(
                        dataOfAddress!.notes! ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
            left:checkArabic()? 10:320,
            top: checkArabic()?8:5,
            child: InkWell(
                onTap: (){
                  HomeCubit.get(context)!.deleteAddresses(
                      addressId: dataOfAddress!.id!);

                },
                child: const Icon(Icons.delete,size:25,color: Colors.red,))),
        Positioned(
            left: checkArabic()?50:280,
            top: 5,
            child: InkWell(
                onTap: (){
                  Navigator.push(context,  MaterialPageRoute(
                    builder: (context) => EditAddressScreen(dataOfAddress: dataOfAddress),));

                },
                child: const Icon(Icons.edit,size:25,color: Colors.black87,)))
      ]
    );
  }
}
