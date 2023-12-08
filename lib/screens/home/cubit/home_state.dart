abstract class HomeState {}

class HomeInitial extends HomeState {}

class BannersLoadingState extends HomeState {}

class BannersSuccessState extends HomeState {}

class BannersFailedState extends HomeState {
  final String errorMessage;

  BannersFailedState({required this.errorMessage});
}

class CategoryLoadingState extends HomeState {}
class CategorySuccessState extends HomeState {}
class CategoryFailedState extends HomeState {
  final String errorMessage;

  CategoryFailedState({required this.errorMessage});
}

class ProductLoadingState extends HomeState {}
class ProductSuccessState extends HomeState {}
class ProductFailedState extends HomeState {
  final String errorMessage;

  ProductFailedState({required this.errorMessage});
}

class SearchSuccessState extends HomeState {}

class FavouritesLoadingState extends HomeState {}
class FavouritesSuccessState extends HomeState {}
class FavouritesFailedState extends HomeState {
  final String errorMessage;

  FavouritesFailedState({required this.errorMessage});
}

class AddOrRemovingFromFavouritesLoadingState extends HomeState {}
class AddOrRemovingFromFavouritesSuccessState extends HomeState {
  final String successMessage;

  AddOrRemovingFromFavouritesSuccessState({required this.successMessage});
}
class AddOrRemovingFromFavouritesFailedState extends HomeState {
  final String errorMessage;

  AddOrRemovingFromFavouritesFailedState({required this.errorMessage});
}


class AddOrRemovingFromCartLoadingState extends HomeState {}
class AddOrRemovingFromCartSuccessState extends HomeState {
  final String successMessage;

  AddOrRemovingFromCartSuccessState({required this.successMessage});
}
class AddOrRemovingFromCartFailedState extends HomeState {
  final String errorMessage;

  AddOrRemovingFromCartFailedState({required this.errorMessage});
}

class GetCartLoadingState extends HomeState {}
class GetCartSuccessState extends HomeState {}
class GetCartFailedState extends HomeState {
  final String? errorMessage;

  GetCartFailedState({this.errorMessage});
}

class UpdateCartLoadingState extends HomeState {}
class UpdateCartSuccessState extends HomeState {}
class UpdateCartFailedState extends HomeState {
  final String? errorMessage;

  UpdateCartFailedState({this.errorMessage});
}

class GetAddressLoadingState extends HomeState {}
class GetAddressSuccessState extends HomeState {}
class GetAddressFailedState extends HomeState {
  final String? errorMessage;

  GetAddressFailedState({this.errorMessage});
}

class DeleteAddressLoadingState extends HomeState {}
class DeleteAddressSuccessState extends HomeState {
  final String successMessage;

  DeleteAddressSuccessState({required this.successMessage});
}
class DeleteAddressFailedState extends HomeState {
  final String? errorMessage;

  DeleteAddressFailedState({this.errorMessage});
}

class UpdateAddressLoadingState extends HomeState {}
class UpdateAddressSuccessState extends HomeState {
  final String successMessage;

  UpdateAddressSuccessState({required this.successMessage});
}
class UpdateAddressFailedState extends HomeState {
  final String? errorMessage;

  UpdateAddressFailedState({this.errorMessage});
}

class AddAddressLoadingState extends HomeState {}
class AddAddressSuccessState extends HomeState {
  final String successMessage;

  AddAddressSuccessState({required this.successMessage});
}
class AddAddressFailedState extends HomeState {
  final String? errorMessage;

  AddAddressFailedState({this.errorMessage});
}

class AddOrderLoadingState extends HomeState {}
class AddOrderSuccessState extends HomeState {
  final String successMessage;

  AddOrderSuccessState({required this.successMessage});
}
class AddOrderFailedState extends HomeState {
  final String? errorMessage;

  AddOrderFailedState({this.errorMessage});
}

class GetOrderLoadingState extends HomeState {}
class GetOrderSuccessState extends HomeState {}
class GetOrderFailedState extends HomeState {
  final String? errorMessage;

  GetOrderFailedState({this.errorMessage});
}

class GetOrderDetailsLoadingState extends HomeState {}
class GetOrderDetailsSuccessState extends HomeState {}
class GetOrderDetailsFailedState extends HomeState {
  final String? errorMessage;

  GetOrderDetailsFailedState({this.errorMessage});
}

class CancelOrderLoadingState extends HomeState {}
class CancelOrderSuccessState extends HomeState {}
class CancelOrderFailedState extends HomeState {
  final String? errorMessage;

  CancelOrderFailedState({this.errorMessage});
}