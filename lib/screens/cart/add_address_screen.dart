
import 'package:e_commerce/models/address/address_model.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/component/custom_text_form_field.dart';
import '../../core/utils/colors.dart';
import '../../generated/l10n.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key, this.dataOfAddress,}) : super(key: key);
  final DataOfAddress? dataOfAddress;
  final  nameController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final detailsController = TextEditingController();
  final TextEditingController? longController = TextEditingController();
  final TextEditingController? latController = TextEditingController();
  final notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).newAddress),
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: mainColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

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
                         Text(
                          S.of(context).addYourNewAddress,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///text form field
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: S.of(context).yourName,
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(),
                            label: S.of(context).name,
                            controller: nameController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return S.of(context).nameIsRequired;
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
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText: S.of(context).nameOfYourCity,
                            label: S.of(context).city,
                            controller: cityController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return S.of(context).thisFieldMustNotBeEmpty;
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
                          width: 15,
                        ),

                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText: S.of(context).nameOfYourRegion,
                            label: S.of(context).region,
                            controller: regionController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return S.of(context).thisFieldMustNotBeEmpty;
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
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText:S.of(context).detailsOfYourRegion,
                            label: S.of(context).details,
                            controller: detailsController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return S.of(context).thisFieldMustNotBeEmpty;
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
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText: S.of(context).yourNotes,
                            label: S.of(context).note,
                            maxLines: 5,
                            controller: notesController,
                            keyboard: TextInputType.number,
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

                    ///buttons
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  HomeCubit.get(context)!.addAddress(
                                    notes: notesController.text,
                                    name: nameController.text,
                                    city: cityController.text,
                                    region: regionController.text,
                                    details: detailsController.text,
                                    long:longController?.text =="" ?0.0:double.parse(longController!.text),
                                    lat: latController!.text!= "" ?double.parse(latController!.text):0.0 ,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9))),
                              child:  Text(
                                S.of(context).add,
                                style: const TextStyle(color: Colors.white,fontSize: 20),
                              ),
                            ),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
