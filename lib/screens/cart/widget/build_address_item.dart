import 'package:e_commerce/models/address/address_model.dart';
import 'package:e_commerce/screens/cart/edit_address_screen.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
          onTap: (){},
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
                      const Text('Client Name :',
                        style: TextStyle(
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
                      const Text(
                        'City Name :  ' ,
                        style: TextStyle(
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
                      const Text(
                        'Region :  ' ,
                        style: TextStyle(
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
                      const Text(
                        'Details :  ' ,
                        style: TextStyle(
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
                      const Text(
                        'Notes :  ' ,
                        style: TextStyle(
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
            left: 320,
            top: 5,
            child: InkWell(
                onTap: (){
                  HomeCubit.get(context)!.deleteAddresses(
                      addressId: dataOfAddress!.id!);

                },
                child: const Icon(Icons.delete,size:25,color: Colors.red,))),
        Positioned(
            left: 280,
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
