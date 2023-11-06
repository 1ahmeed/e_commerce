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
class GetCartFailedStatState extends HomeState {
  final String? errorMessage;

  GetCartFailedStatState({this.errorMessage});
}

