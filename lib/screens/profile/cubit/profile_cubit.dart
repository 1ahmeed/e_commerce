import 'dart:convert';

import 'package:e_commerce/models/profile/profile_model.dart';
import 'package:e_commerce/models/profile/user_model.dart';
import 'package:e_commerce/core/local_data.dart';
import 'package:e_commerce/screens/auth_screen/login_screen.dart';
import 'package:e_commerce/screens/profile/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../core/component/custom_navigation_and_finish.dart';
import '../../../core/constant.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(LayoutInitialStates());

  static ProfileCubit? get(context) => BlocProvider.of(context);

  UserModel? userModel;
  ProfileModel? profileModel;

  void getUserData() async {
    emit(GetUserDataLoadingStates());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/profile"),
        headers: {
          "Authorization": token!,
          "lang": "en",
          "Content-Type": "application/json"
        },
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          profileModel = ProfileModel.fromJson(responseData);
          // print(responseData);
          emit(GetUserDataSuccessStates());
        } else {
          emit(GetUserDataFailedStates(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      emit(GetUserDataFailedStates(errorMessage: e.toString()));
    }
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(UpdateUserDataLoadingStates());
    try {
      Response response = await http.put(
        Uri.parse("https://student.valuxapps.com/api/update-profile"),
        headers: {"lang": "en", "Authorization": token!},
        body: {
          "name": name,
          "email": email,
          "phone": phone,
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          ///emit success
          profileModel = ProfileModel.fromJson(responseData);
          // getUserData();
          emit(UpdateUserDataSuccessStates(
              successMessage: responseData['message']));
        } else {
          ///fail
          emit(UpdateUserDataFailedStates(
              errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      // print(e.toString());
      emit(UpdateUserDataFailedStates(errorMessage: e.toString()));
    }
  }

  void changePassword({
  required String oldPassword,
  required String newPassword,
})async{
    emit(ChangePasswordLoadingStates());
    try {
      Response response=await http.post(
          Uri.parse("https://student.valuxapps.com/api/change-password") ,
        headers: {
            "lang":"en",
          // "Content-Type":"application/json",
          "Authorization":token!
        },
        body: {
            "current_password":oldPassword,
            "new_password":newPassword,
        }
      );
      var responseData=jsonDecode(response.body);
      if(response.statusCode==200){
        if(responseData['status']==true){
         await CacheNetwork.insertIntoCache(key: "password", value: newPassword);
         currentPassword=CacheNetwork.getData(key: "password");
          emit(ChangePasswordSuccessStates(successMessage: responseData['message']));
        }else{
          emit(ChangePasswordFailedStates(errorMessage:responseData['message']));
        }
      }
    } catch (e) {
      // print(e.toString());
    emit(ChangePasswordFailedStates(errorMessage: e.toString()));
    }
  }


  void signOut(context) {
    CacheNetwork.removeData(key: 'token').then((value){
      if(value==true){
        navigatorAndFinish(context, LoginScreen());
      }
    });
  }

  IconData suffix= Icons.visibility;
  bool isPassword=true;
  void changeVisibility(){
    isPassword=!isPassword;
    suffix=isPassword? Icons.visibility:Icons.visibility_off;
    emit(ChangeVisibilitySuccessState());
  }

  IconData suffix2= Icons.visibility;
  bool isPassword2=true;
  void changeVisibility2(){
    isPassword2=!isPassword2;
    suffix2=isPassword2? Icons.visibility:Icons.visibility_off;
    emit(ChangeVisibilitySuccessState());
  }
  
  void sendReportFromUserToAdmin({
  required String name,
  required String email,
  required String phone,
  required String message,
})async{
    emit(SendMessageLoadingStates());
    try {
      Response response =await http.post(Uri.parse("https://student.valuxapps.com/api/complaints"),
      headers: {
        "lang":"ar",
      },
        body: {
        "name":name,
        "phone":phone,
        "email":email,
        "message":message,
        },
      );
      var responseData=jsonDecode(response.body);
      if(response.statusCode==200){
        if(responseData['status']==true){
          ///emit success
          emit(SendMessageSuccessStates(successMessage: responseData['message']));
        }else{
          ///eit failed
          emit(SendMessageFailedStates(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(SendMessageFailedStates(errorMessage: e.toString()));

    }
}

}
