import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/screens/profile/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/component/custom_bottom.dart';
import '../../core/component/custom_text_form_field.dart';
import '../../core/utils/colors.dart';
import '../../generated/l10n.dart';
import 'cubit/profile_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessStates) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.successMessage)));
        } else if (state is ChangePasswordFailedStates) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:Text(S.of(context).changePassword),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: mainColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
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
                    controller: currentPasswordController,
                    keyboard: TextInputType.number,
                    suffixIcon: ProfileCubit.get(context)?.suffix,
                    suffixPressed: () {
                      ProfileCubit.get(context)?.changeVisibility();
                    },
                    isPassword: ProfileCubit.get(context)!.isPassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return S.of(context).oldPasswordMustNotBeEmpty;
                      }
                      return null;
                    },
                    label: S.of(context).oldPassword,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    border: const OutlineInputBorder(),
                    controller: newPasswordController,
                    keyboard: TextInputType.number,
                    suffixIcon: ProfileCubit.get(context)?.suffix2,
                    suffixPressed: () {
                      ProfileCubit.get(context)?.changeVisibility2();
                    },
                    isPassword: ProfileCubit.get(context)!.isPassword2,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return S.of(context).newPasswordMustNotBeEmpty;
                      }
                      return null;
                    },
                    label: S.of(context).newPassword,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      background: mainColor,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          if (currentPasswordController.text.trim() ==
                              currentPassword) {
                            if (newPasswordController.text.length >= 6) {
                              ProfileCubit.get(context)?.changePassword(
                                oldPassword: currentPassword!,
                                newPassword: newPasswordController.text,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          S.of(context).passwordMustBeAtLeast6Character)));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    S.of(context).verifyOldPasswordAndTryAgain)));
                          }
                        }
                      },
                      text: state is ChangePasswordLoadingStates
                          ? 'Loading Changes....'
                          : S.of(context).change),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
