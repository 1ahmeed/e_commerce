import 'dart:convert';
import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/core/local_data.dart';
import 'package:e_commerce/screens/auth_screen/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class AuthCubit extends Cubit<AuthStates>{
  AuthCubit(): super(AuthInitialState());

  static AuthCubit? get(context) => BlocProvider.of(context);

  void register({
  required String name,
  required String email,
  required String phone,
  required String password,
})async{
    emit(RegisterLoadingState());
     try {
       Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/register"),
        headers: {
            "lang":"en"
        },
        body: {
            "name":name,
          "email":email,
          "phone":phone,
          "password":password
        }
           );
       if (response.statusCode==200)
        {
          var responseBody = jsonDecode(response.body);
          if (responseBody["status"] == true) {
            //success
            // print(responseBody);
            // print(responseBody["data"]["token"]);
            await CacheNetwork.insertIntoCache(key: "token", value: responseBody["data"]["token"]);
            await CacheNetwork.insertIntoCache(key: "password", value: password);
            currentPassword=CacheNetwork.getData(key: "password");
            emit(RegisterSuccessState());
          } else {
            //
            // print(responseBody);
            emit(RegisterFailedState(errorMessage: responseBody['message']));
          }
        }
    } catch (e) {
       emit(RegisterFailedState(errorMessage:e.toString()));
     }

  }

IconData suffix= Icons.visibility;
  bool isPassword=true;
  void changeVisibility(){
    isPassword=!isPassword;
    suffix=isPassword? Icons.visibility:Icons.visibility_off;
    emit(ChangeVisibilitySuccessState());
  }

  void login({
    required String email,
    required String password,
  })async{
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/login"),
          headers: {
            "lang":"ar"
          },
          body: {
            "email":email,
            "password":password
          }
      );
      if (response.statusCode==200)  {
        var responseBody=jsonDecode(response.body);
        if(responseBody["status"]==true){
          //success
          // print(responseBody);
          // print(responseBody["data"]["token"]);
          await CacheNetwork.insertIntoCache(key: "token", value: responseBody["data"]["token"]);
          await CacheNetwork.insertIntoCache(key: "password", value: password);
          emit(LoginSuccessState());
        }else{
          //failed
          // print(responseBody);
          emit(LoginFailedState(errorMessage:responseBody['message']));
        }
      }
    } catch (e) {
      emit(LoginFailedState(errorMessage:e.toString()));

    }

  }
}