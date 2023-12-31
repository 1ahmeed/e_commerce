import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/component/custom_bottom.dart';
import '../../core/component/custom_text_form_field.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../cubit/profile_cubit/profile_states.dart';
import '../../localization/generated/l10n.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is SendMessageSuccessStates) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.successMessage)));
        } else if (state is UpdateUserDataFailedStates) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.errorMessage)));
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
            title: Text(S.of(context).help),
            elevation: 0,
            foregroundColor:AppColor. mainColor,
            backgroundColor: Colors.transparent,
          ),
          body: ProfileCubit.get(context)!.profileModel != null
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                            isClickable: false,
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
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).textTheme.bodyMedium!.color!
                                )
                            ),
                            border:  const OutlineInputBorder(),
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
                              colorIconPrefix: Theme.of(context).iconTheme.color
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            isClickable: false,
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
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).textTheme.bodyMedium!.color!
                                )
                            ),

                            border:  const OutlineInputBorder(),
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
                              colorIconPrefix: Theme.of(context).iconTheme.color

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            isClickable: false,
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
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).textTheme.bodyMedium!.color!
                                )
                            ),
                            border:  const OutlineInputBorder(),
                            controller: phoneController,
                            keyboard: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return S.of(context).phoneMustNotBeEmpty;
                              }
                              return null;
                            },
                            label: S.of(context).phone,
                            prefixIcon: Icons.phone,
                              colorIconPrefix: Theme.of(context).iconTheme.color

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            controller: messageController,
                            keyboardType: TextInputType.text,
                            // onFieldSubmitted: onSubmit,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return S.of(context).pleaseEnterYourMessage;
                              }
                              return null;
                            },
                            maxLines: 5,
                            decoration: InputDecoration(
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
                              hintText: S.of(context).enterYourMessage,
                              labelText: S.of(context).note,),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              background: AppColor.mainColor,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ProfileCubit.get(context)
                                      ?.sendReportFromUserToAdmin(
                                    message: messageController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                  );
                                  messageController.clear();
                                }
                              },
                              text: state is SendMessageLoadingStates
                                  ? 'Wait....'
                                  : S.of(context).send),
                        ],
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
