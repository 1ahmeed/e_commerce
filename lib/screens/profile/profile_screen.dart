
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/component/custom_bottom.dart';
import '../../core/component/custom_text_form_field.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../cubit/profile_cubit/profile_states.dart';
import '../../localization/generated/l10n.dart';

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
          appBar: AppBar(
            title:  Text(S.of(context).update),
            elevation: 0,
            foregroundColor: AppColor.mainColor,
            backgroundColor: Colors.transparent,
          ),
            body: ProfileCubit.get(context)!.profileModel != null
                ? Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(model!.data!.image!),
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).textTheme.bodyMedium!.color!
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).textTheme.bodyMedium!.color!
                          )
                      ),
                      border:  const OutlineInputBorder(),
                      colorIconPrefix: Theme.of(context).iconTheme.color ,
                      controller: nameController,
                      keyboard: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return S.of(context).nameMustNotBeEmpty;
                        }
                        return null;
                      },
                      label: S.of(context).name,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).textTheme.bodyMedium!.color!
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).textTheme.bodyMedium!.color!
                          )
                      ),
                      border:  const OutlineInputBorder(),
                      colorIconPrefix: Theme.of(context).iconTheme.color ,
                      controller: emailController,
                      keyboard: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return S.of(context).emailMustNotBeEmpty;
                        }
                        return null;
                      },
                      label: S.of(context).emailAddress,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).textTheme.bodyMedium!.color!
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).textTheme.bodyMedium!.color!
                          )
                      ),
                      border:  const OutlineInputBorder(),
                      colorIconPrefix: Theme.of(context).iconTheme.color ,                      controller: phoneController,
                      keyboard: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return S.of(context).phoneMustNotBeEmpty;
                        }
                        return null;
                      },
                      label: S.of(context).phone,
                      prefixIcon: Icons.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      background: AppColor.mainColor,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            ProfileCubit.get(context)?.updateUserData(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                            );
                          }
                        },
                        text:state is UpdateUserDataLoadingStates? 'Loading Update....':S.of(context).update
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
