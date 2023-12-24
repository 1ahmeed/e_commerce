import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/screens/cart/add_address_screen.dart';
import 'package:e_commerce/screens/cart/widget/build_address_item.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';


class OrderAddressScreen extends StatelessWidget {
  OrderAddressScreen({Key? key}) : super(key: key);
  final clientNameController = TextEditingController();
  final phoneController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        HomeCubit.get(context)!.getAddresses();
        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if(state is UpdateAddressSuccessState){
              showDialog(context: context,  builder: (context) => AlertDialog(
                content: Text(state.successMessage,style: const TextStyle(color: Colors.white),),
                backgroundColor: Colors.green,
              ),);

            }
            if(state is AddAddressSuccessState){
              showDialog(context: context,  builder: (context) => AlertDialog(
                content: Text(state.successMessage,style: const TextStyle(color: Colors.white),),
                backgroundColor: Colors.green,
              ),);

            }
            if(state is DeleteAddressSuccessState){
              showDialog(context: context,  builder: (context) => AlertDialog(
                content: Text(state.successMessage,style: const TextStyle(color: Colors.white),),
                backgroundColor: Colors.green,
              ),);

            }

          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title:  Text(S.of(context).chooseYourAddress),
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: mainColor,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddAddressScreen(),));

                },
                backgroundColor: mainColor,


                child: const Icon(Icons.add),
              ),
              body: HomeCubit.get(context)!.addressModel !=null ?
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
                            itemBuilder: (context, index) =>
                                BuildAddressItem(index: index,
                                    dataOfAddress: HomeCubit.get(context)!.addressModel!.data!.data![index]),
                            itemCount: HomeCubit.get(context)!.addressModel!.data!.data!.length,
                          ),
                        ),

                      ],
                    )
                ),
              ):
              const Center(child: CircularProgressIndicator(),)
              ,
            );
          },
        );
      }
    );
  }
}
/*
Column(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: double.infinity,),
              ///headers
              Row(
                children: <Widget>[
                  Container(
                    width: 3,
                    height: 30,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Choose Address",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              ///text form field
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .06,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      keyboard: TextInputType.text,
                      label: "Client name",
                      controller: clientNameController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return " name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .06,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      label: "Phone",
                      controller: phoneController,
                      keyboard: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return " phone is empty";
                        }else if(value.length!=14){
                          return"must enter 14 digit number";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .06,
                  ),

                  Expanded(
                    child: CustomTextFormField(
                      hintText: "Auto Generate",
                      // label: "Number",
                      controller: numberController,
                      keyboard: TextInputType.number,
                      isClickable: false,
                      validate: (value) {
                        if (value!.isEmpty) {
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .06,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      keyboard: TextInputType.text,
                      label: "Address",
                      controller: addressController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return " address field is empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        clientNameController.clear();
                        phoneController.clear();
                        numberController.clear();
                        addressController.clear();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          // CompanyCubit.get(context)!.insertDatabaseForClient(
                          //   context:context ,
                          //   phone: phoneController.text,
                          //   address: addressController.text,
                          //   clientName: clientNameController.text,
                          //   // number: int.parse(numberController.text),
                          // );
                          clientNameController.clear();
                          phoneController.clear();
                          numberController.clear();
                          addressController.clear();

                        }

                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9))),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   FontAwesomeIcons.penToSquare,
                          //   color: Colors.white,
                          //   size: 20,
                          // ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
 */