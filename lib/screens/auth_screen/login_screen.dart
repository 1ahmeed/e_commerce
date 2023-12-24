
import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/core/local_data.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_state.dart';
import 'package:e_commerce/screens/auth_screen/rersgister_screen.dart';
import 'package:e_commerce/screens/layout/layout_screen.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/component/custom_bottom.dart';
import '../../core/component/custom_text_form_field.dart';
import '../../generated/l10n.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
              token= CacheNetwork.getData(key: "token");
              currentPassword= CacheNetwork.getData(key: "password");
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                  backgroundColor: Colors.green,
                  content:Text(S.of(context).loginSuccessfully)));
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>  LayoutScreen(),));
            token=CacheNetwork.getData(key: "token");


          }else if(state is LoginFailedState){
            showDialog(context: context,  builder: (context) => AlertDialog(
              content: Text(state.errorMessage,style: const TextStyle(color: Colors.white),),
              backgroundColor: Colors.red,
            ),);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/login_background.png"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  ///todo
                  // const SizedBox(height: 30,),
                  // Row(
                  //   children: [
                  //
                  //   TextButton(onPressed: (){
                  //     AuthCubit.get(context)!.changeLang();
                  //   }, child: Directionality(
                  //     textDirection: TextDirection.rtl,
                  //     child: Row(
                  //       children: [
                  //         const Icon(Icons.language,color: Colors.black87,),
                  //         const SizedBox(width: 5,),
                  //         Text(AuthCubit.get(context)!.checkArabic()?"عربي":"english",
                  //           style: const TextStyle(fontSize: 20,color: Colors.black87),),
                  //       ],
                  //     ),
                  //   ))
                  //   ],
                  // ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 40),
                      child:  Text(
                        S.of(context).loginToContinueProcess,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 35,
                                ),
                                 Text(
                                  S.of(context).login,
                                  style: const TextStyle(
                                      color: mainColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                CustomTextFormField(
                                    controller: emailController,
                                    keyboard: TextInputType.emailAddress,
                                    hintText: S.of(context).email,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return S.of(context).pleaseEnterYourEmail;
                                      }
                                      return null;
                                    },
                                    // label: "email",
                                    prefixIcon: Icons.email_outlined),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextFormField(
                                    controller: passwordController,
                                    keyboard: TextInputType.visiblePassword,
                                    hintText: S.of(context).password,
                                    maxLines: 1,
                                    suffixIcon: AuthCubit.get(context)?.suffix,
                                    suffixPressed: () {
                                      AuthCubit.get(context)?.changeVisibility();
                                    },
                                    isPassword:
                                        AuthCubit.get(context)!.isPassword,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return S.of(context).pleaseEnterYourPassword;
                                      }
                                      return null;
                                    },
                                    // label: "email",
                                    prefixIcon: Icons.lock),
                                const SizedBox(
                                  height: 40,
                                ),
                                CustomButton(
                                  ///todo
                                  background: mainColor,
                                    text:state is LoginLoadingState? "${S.of(context).loading}...":S.of(context).login,
                                    function: (){
                                      if(formKey.currentState!.validate()){
                                        AuthCubit.get(context)!.login(
                                            email: emailController.text,
                                            password: passwordController.text);

                                      }
                                    },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(text:  const  TextSpan(
                                      children: [
                                        ///todo
                                        TextSpan(text:'Don\'t have account ?   ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12)),
                                        // TextSpan(text:"Click Here",style: TextStyle(color: mainColor,fontWeight: FontWeight.bold,fontSize: 12)),
                                      ]
                                    )),
                                    InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                                      } ,
                                      child:  Text(S.of(context).clickHere,style: const TextStyle(color: mainColor,fontWeight: FontWeight.bold,fontSize: 12)),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      );
  }
}
