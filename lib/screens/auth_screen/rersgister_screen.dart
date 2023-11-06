import 'package:e_commerce/screens/auth_screen/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_state.dart';
import 'package:e_commerce/screens/auth_screen/login_screen.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/component/custom_text_form_field.dart';
import '../../core/constant.dart';
import '../../core/local_data.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
   final formKey = GlobalKey<FormState>();
final nameController=TextEditingController();
final emailController=TextEditingController();
final phoneController=TextEditingController();
final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if(state is RegisterSuccessState){
          token= CacheNetwork.getData(key: "token");

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>   LayoutScreen(),));
        }else if(state is RegisterFailedState){
          showDialog(context: context,  builder: (context) => AlertDialog(
            content: Text(state.errorMessage,style: const TextStyle(color: Colors.white),),
            backgroundColor: Colors.red,
          ),);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "Register now to browse our hot offers",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                          controller: nameController,
                          keyboard: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your name";
                            }
                            return null;
                          },
                          label: "Name",
                          prefixIcon: Icons.person),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your email";
                            }
                            return null;
                          },
                          label: "Email",
                          prefixIcon: Icons.email),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          controller: phoneController,
                          keyboard: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your phone";
                            }
                            return null;
                          },
                          label: "Phone",
                          prefixIcon: Icons.phone),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          controller: passwordController,
                          keyboard: TextInputType.visiblePassword,
                          suffixIcon: AuthCubit.get(context)?.suffix,
                          suffixPressed: () {
                            AuthCubit.get(context)
                                ?.changeVisibility();
                          },
                          isPassword:
                          AuthCubit.get(context)!.isPassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }else if(int.parse(value) <= 6){
                              return "password is too short";
                            }
                            return null;
                          },
                          label: "Password",
                          prefixIcon: Icons.lock),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            AuthCubit.get(context)!.register(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text);
                          }

                        },
                        color: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child:  Text(
                          state is RegisterLoadingState?
                          "loading....":"Register",style:
                        const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                      ),
                      const SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          const Text('Already have an account? ',style: TextStyle(color: Colors.black)),
                          const SizedBox(width: 4,),
                          InkWell(
                            onTap: ()
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
                            },
                            child: const Text('login in',style: TextStyle(color: mainColor,fontWeight: FontWeight.bold)),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
