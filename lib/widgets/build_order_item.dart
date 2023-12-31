import 'package:e_commerce/models/order/order_model.dart';
import 'package:e_commerce/screens/order/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../localization/generated/l10n.dart';

class BuildOrderItem extends StatelessWidget {
  BuildOrderItem({Key? key, this.index, this.dataOfOrder}) : super(key: key);
  final DataOfOrder? dataOfOrder;
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
    return InkWell(
      onTap: () {
        HomeCubit.get(context)!.getOrderDetails(orderId: dataOfOrder!.id);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => const OrderDetailsScreen(),));
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
              const SizedBox(height: 15,),

              ///total
              Row(
                children: [
                   Text('${S.of(context).total} ',
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
                    dataOfOrder!.total.toString(),
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

              ///date
              Row(
                children: [
                   Text(
                    '${S.of(context).date} :  ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),

                  ),
                  Text(
                    dataOfOrder!.date.toString(),
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

              ///status
              Row(
                children: [
                   Text(
                    '${S.of(context).status} :  ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),

                  ),
                  Text(
                    dataOfOrder!.status.toString(),
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
      )

    );
  }
}
