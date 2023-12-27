import 'package:e_commerce/core/component/custom_navigation_and_finish.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/dialog_utils.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/home_cubit/home_state.dart';
import '../../localization/generated/l10n.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model=HomeCubit.get(context)!.orderDetailsModel;
        return Scaffold(
            appBar: AppBar(
              title:  Text(S.of(context).orderDetails),
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColor.mainColor,
            ),
            body: HomeCubit.get(context)!.orderDetailsModel != null
                ? Container(
              height: 700,
                  width: 400,
                  margin: const EdgeInsets.all(20),
                  child: Card(
              elevation: 10,
                    color: Colors.grey.shade300,

                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [

                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Expanded(child: Center(child: SvgPicture.asset("images/logo.svg")))),

                                  ],
                                ),
                                ///client details
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                           Text(
                                            "${S.of(context).name}:",
                                            style: const TextStyle(
                                              color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                           model!.data!
                                                .address!
                                                .name!,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            "${S.of(context).address}:",
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            child: Text(
                                              "${model.data!.address!.city}-${model.data!.address!.region}-${model.data!.address!.details}",
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            "${S.of(context).date}:",
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            model.data!.date!,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            S.of(context).paymentMethod,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            model.data!.paymentMethod!,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            S.of(context).status,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            model.data!.status!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                            color: Colors.red
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(thickness: 2),
                                      const Divider(thickness: 2),
                                    ],
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            S.of(context).productName,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            S.of(context).quantity,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text(
                                            S.of(context).costPerOne,
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                ///item details in fatoura
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:  model.data!.products!.length,
                                  itemBuilder: (context, index) =>  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            ///product Name
                                            SizedBox(
                                              width: 115,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Text(
                                                  model.data!.products![index].name!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  style: const TextStyle(
                                                      color: AppColor.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                           const SizedBox(width: 50,),

                                            Text(
                                              model.data!.products![index].quantity!.toString(),
                                              style: const TextStyle(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              model.data!.products![index].price.toString(),
                                              style: const TextStyle(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  ),
                                ),
                                ///total
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            S.of(context).cost,
                                            style: const TextStyle(
                                              color: AppColor.black,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            model.data!.cost.toString(),
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontSize: 17.0),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            "${S.of(context).discount} :",
                                            style: const TextStyle(
                                              color: AppColor.black,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            model.data!.discount.toString(),
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontSize: 17.0),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            S.of(context).points,
                                            style: const TextStyle(
                                              color: AppColor.black,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            // '{widget.billsModel.orderTotalPrice}'
                                           model.data!.points.toString(),
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontSize: 17.0),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Expanded(
                                             child: Text(
                                              S.of(context).vat,
                                              style: const TextStyle(
                                                color: AppColor.black,
                                                fontSize: 15.0,
                                              ),
                                          ),
                                           ),
                                          const Spacer(),
                                          Text(
                                            model.data!.vat.toString(),
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontSize: 17.0),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                           Text(
                                            S.of(context).total,
                                            style: const TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            // '{widget.billsModel.orderTotalPrice}'
                                            model.data!.total.toString(),
                                            style: const TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FloatingActionButton.extended(
                                  heroTag: "btn1",
                                  backgroundColor:AppColor.mainColor,
                                  // Colors.blue[900]!,
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                        color: AppColor.mainColor, width: 4),
                                  ),
                                  onPressed: () {
                                    navigatorAndFinish(context, LayoutScreen());
                                  },
                                  label:  Text(
                                    S.of(context).goToHome,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: const Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextButton(onPressed: (){
                                  if(model.data!.status=="Cancelled" ){
                                    DialogUtils.showMessage(context,
                                        S.of(context).thisOrderIsAlreadyCancelled,
                                        posActionTitle: "ok",
                                        posAction: (){
                                          Navigator.pop(context);
                                        }
                                    );
                                  }else{
                                    DialogUtils.showWidget(context,
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(S.of(context).doYouWantCancelThisOrder,
                                              style: TextStyle(
                                                color: Colors.red[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      posActionTitle: "Yes",
                                      posAction: (){
                                        DialogUtils.showLoading(context, "Loading...");
                                        HomeCubit.get(context)!.cancelOrder(
                                          orderId: model.data!.id!,);
                                        DialogUtils.hideLoading(context);
                                        DialogUtils.showMessage(context,
                                            S.of(context).theOrderHasBeenSuccessfullyCanceled,
                                            posActionTitle: "ok",
                                            posAction: (){
                                              Navigator.pop(context);
                                            }
                                        );

                                      },
                                      negActionTitle: "No",
                                      negAction:()async{
                                      } ,

                                    );
                                  }

                                }, child:  Text(S.of(context).cancelOrder,style: const TextStyle(color: Colors.red),))
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                )
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
