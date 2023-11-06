
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/component/custom_bottom.dart';
import '../../core/component/custom_text_form_field.dart';
import 'cubit/profile_cubit.dart';
import 'cubit/profile_states.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if(state is UpdateUserDataSuccessStates){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
              content:Text(state.successMessage)
          ));
        }else if(state is UpdateUserDataFailedStates){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content:Text(state.errorMessage)
          ));
        }
      },
      builder: (context, state) {
        var model = ProfileCubit.get(context)?.profileModel;
        if (model != null) {
          nameController.text = model.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
        }
        return Scaffold(
            body: ProfileCubit.get(context)!.profileModel != null
                ? Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 100),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      border: const OutlineInputBorder(),
                      controller: nameController,
                      keyboard: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name Must Not Be Empty ';
                        }
                        return null;
                      },
                      label: 'Name',
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      border: const OutlineInputBorder(),

                      controller: emailController,
                      keyboard: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email Must Not Be Empty ';
                        }
                        return null;
                      },
                      label: 'EmailAddress',
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      border: const OutlineInputBorder(),
                      controller: phoneController,
                      keyboard: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone Must Not Be Empty ';
                        }
                        return null;
                      },
                      label: 'Phone Number',
                      prefixIcon: Icons.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      background: mainColor,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            ProfileCubit.get(context)?.updateUserData(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                            );
                          }
                        },
                        text:state is UpdateUserDataLoadingStates? 'Loading Update....':'Update'
                    ),


                  ],
                ),
              ),
            )
                : const  Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
