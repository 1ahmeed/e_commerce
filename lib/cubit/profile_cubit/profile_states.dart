
abstract class ProfileStates{}

class LayoutInitialStates extends ProfileStates{}

class GetUserDataLoadingStates extends ProfileStates{}
class GetUserDataSuccessStates extends ProfileStates{}
class GetUserDataFailedStates extends ProfileStates{
  final String errorMessage;

  GetUserDataFailedStates({required this.errorMessage});
}


class UpdateUserDataLoadingStates extends ProfileStates{}
class UpdateUserDataSuccessStates extends ProfileStates{
  final String successMessage;

  UpdateUserDataSuccessStates({required this.successMessage});
}
class UpdateUserDataFailedStates extends ProfileStates{
  final String errorMessage;

  UpdateUserDataFailedStates({required this.errorMessage});
}


class ChangePasswordLoadingStates extends ProfileStates{}
class ChangePasswordSuccessStates extends ProfileStates{
  final String successMessage;

  ChangePasswordSuccessStates({required this.successMessage});
}
class ChangePasswordFailedStates extends ProfileStates{
  final String errorMessage;

  ChangePasswordFailedStates({required this.errorMessage});
}


class ChangePasswordVisibilitySuccessState extends ProfileStates{}
class SendMessageLoadingStates extends ProfileStates{}
class SendMessageSuccessStates extends ProfileStates{
  final String successMessage;

  SendMessageSuccessStates({required this.successMessage});
}
class SendMessageFailedStates extends ProfileStates{
  final String errorMessage;

  SendMessageFailedStates({required this.errorMessage});
}
