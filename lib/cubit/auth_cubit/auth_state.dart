import 'package:e_commerce/models/profile/user_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailedState extends AuthStates {
 final String errorMessage;

  RegisterFailedState({required this.errorMessage});

}

class ChangeVisibilitySuccessState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
 final UserModel? userModel;

  LoginSuccessState({this.userModel});
}

class LoginFailedState extends AuthStates {
 final String errorMessage;

 LoginFailedState({required this.errorMessage});

}

class ChangeLangSuccessState extends AuthStates {}


