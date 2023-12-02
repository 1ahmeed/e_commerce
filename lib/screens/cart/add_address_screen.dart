
import 'package:e_commerce/models/address/address_model.dart';
import 'package:e_commerce/screens/home/cubit/home_cubit.dart';
import 'package:e_commerce/screens/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/component/custom_text_form_field.dart';
import '../../core/utils/colors.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key, this.dataOfAddress}) : super(key: key);
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
            title: const Text("Add"),
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
                        const Text(
                          "Add Your New Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                            hintText: "your name",
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(),
                            label: "Name",
                            controller: nameController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
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
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText: "name of your city",
                            label: "City",
                            controller: cityController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return " this field must not be empty";
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
                            hintText: "name of your region",
                            label: "Region",
                            controller: regionController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return "this field must not be empty";
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
                            hintText: "details of your region",
                            label: "Details",
                            controller: detailsController,
                            validate: (value) {
                              if (value!.trim().isEmpty) {
                                return " this field must not be empty";
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
                            hintText: "your latitude on gps (optional) ",
                            label: "latitude",
                            controller: latController!,
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
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText: "your longitude on gps (optional) ",
                            label: "longitude",
                            controller: longController!,
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
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            enabledBorder: const OutlineInputBorder(),
                            border: const OutlineInputBorder(),
                            hintText: "your notes (optional)",
                            label: "Note",
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
                              child: const Text(
                                'Add',
                                style: TextStyle(color: Colors.white,fontSize: 20),
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
