


import 'dart:convert';
import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/models/banners/banners_data.dart';
import 'package:e_commerce/models/carts/cart_model.dart';
import 'package:e_commerce/models/categories/category_data.dart';
import 'package:e_commerce/models/change_carts/change_cart_data.dart';
import 'package:e_commerce/models/change_favourite/change_favourite_data.dart';
import 'package:e_commerce/models/favourites/favourite_model.dart';
import 'package:e_commerce/models/product/products_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:http/http.dart'as http;

import 'home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit? get(context) => BlocProvider.of(context);

  List<BannersData> bannersData=[];
  void getBanners()async{
    emit(BannersLoadingState());
    try {
      Response response=await http.get(
        Uri.parse("https://student.valuxapps.com/api/banners"),
      );
         var responseData= jsonDecode(response.body);
         if(response.statusCode==200){
       if(responseData['status']==true){

         for(var item in responseData['data']){
           bannersData.add(BannersData.fromJson(item));
         }
         // print(bannersData);
         emit(BannersSuccessState());
       }else{
         ///emit failed
         emit(BannersFailedState(errorMessage: responseData['message']));
       }
         }
    } on Exception catch (e) {
      /// emit failed
      emit(BannersFailedState(errorMessage: e.toString()));
    }
  }


  List<CategoryData> categoryData=[];
  void getCategories()async{
    emit(CategoryLoadingState());
    try {
      Response response=await http.get(
        Uri.parse("https://student.valuxapps.com/api/categories"),
        headers: {
          "lang":"en"
        }
      );
      var responseData= jsonDecode(response.body);
      if(response.statusCode==200){
        if(responseData['status']==true){

          for(var item in responseData['data']['data']){
            categoryData.add(CategoryData.fromJson(item));
          }
          // print(categoryData);
          emit(CategorySuccessState());
        }else{
          ///emit failed
          emit(CategoryFailedState(errorMessage: responseData['message']));
        }
      }
    } on Exception catch (e) {
      /// emit failed
      emit(CategoryFailedState(errorMessage: e.toString()));
    }
  }

  Map<num,bool> favouritesId = {};
  Map<num,bool> cartsId = {};
  List<ProductsData> productData=[];
  void getProducts()async{
    emit(ProductLoadingState());
    try {
      Response response=await http.get(
          Uri.parse("https://student.valuxapps.com/api/home"),
          headers: {
            "lang":"en",
            "Authorization":token!,
          }
      );
      var responseData= jsonDecode(response.body);
      if(response.statusCode==200){
        if(responseData['status']==true){

          for(var item in responseData['data']['products']){
            productData.add(ProductsData.fromJson(item));
            favouritesId.addAll({
              item['id']:item['in_favorites']
            });
            cartsId.addAll({
              item['id']:item['in_cart']
            });
          }
          print("*************");
          print(favouritesId);
          print(productData);
          emit(ProductSuccessState());
        }else{
          ///emit failed
          emit(ProductFailedState(errorMessage: responseData['message']));
        }
      }
    } on Exception catch (e) {
      /// emit failed
      emit(ProductFailedState(errorMessage: e.toString()));
    }
  }

  List<ProductsData> productAfterFiltered=[];
  void getProductAfterFiltered({required
  String input}){
    productAfterFiltered= productData.where((element) =>
    element.name!.toLowerCase().startsWith(input.toLowerCase())
    ).toList();
   emit(SearchSuccessState());
  }

  FavouritesModel? favouriteModel;
  ChangeFavouriteData? changeFavouriteData;
  Future<void> getFavourites() async {
    // favourites = [];
    emit(FavouritesLoadingState());
    try {
      Response response = await http.get(
          Uri.parse("https://student.valuxapps.com/api/favorites"),
          headers: {
            "lang": "en",
            "Authorization": token!,
          });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          favouriteModel=FavouritesModel.fromJson( responseData);
          // for (var item in responseData['data']['data']) {
          //   productFavouriteData=ProductFavouriteData.fromJson( item['product']);
          //
          //   // favourites.add(ProductFavouriteData.fromJson(item['product']));
          //
          //   // favouritesId.add(item['product']['id'].toString());
          // }
          // print(favouriteModel);
          emit(FavouritesSuccessState());
        } else {
          ///emit failed
          emit(FavouritesFailedState(errorMessage: responseData['message']));
        }
      }
    } on Exception catch (e) {
      /// emit failed
      emit(FavouritesFailedState(errorMessage: e.toString()));
    }
  }

  void addOrRemoveFromFavourite({required  productId}) async {
    favouritesId[productId] = !favouritesId[productId]!;
    emit(AddOrRemovingFromFavouritesLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/favorites"),
          headers: {"lang": "en","Authorization": token! },
          body: {"product_id": productId.toString()});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          changeFavouriteData=ChangeFavouriteData.fromJson(responseData['data']['product']);
          await getFavourites();
          emit(AddOrRemovingFromFavouritesSuccessState(successMessage: responseData['message']));
        } else {
          favouritesId[productId] = !favouritesId[productId]!;
          //emit failed
          // print(responseData['message']);
          emit(AddOrRemovingFromFavouritesFailedState(
              errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      favouritesId[productId] = !favouritesId[productId]!;
      // emit failed
      // print(e.toString());
      emit(AddOrRemovingFromFavouritesFailedState(errorMessage: e.toString()));
    }

  }

  ///cart api
  ChangeCartData? changeCartData;
  CartModel? cartModel;
  num total=0;
  Future<void> getCarts()async{
    emit(GetCartLoadingState());
    try {
      Response response=  await http.get(Uri.parse("https://student.valuxapps.com/api/carts"),
        headers: {
          "lang":"en",
          "Authorization":token!
        },
      );
      var responseData=jsonDecode(response.body);
      if(response.statusCode==200){
        if(responseData['status']==true){
          total=responseData['data']['total'];
          cartModel=CartModel.fromJson(responseData);
          // print(total);
          // print(cartModel);
          emit(GetCartSuccessState());
          //emit success
          //get data
        }else{
          //emit false
          emit(GetCartFailedStatState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      // print(e.toString());
      // emit false
      emit(GetCartFailedStatState(errorMessage: e.toString()));
    }
  }

  void addOrRemoveFromCart({required  int productId})async{
    cartsId[productId] = !cartsId[productId]!;
    emit(AddOrRemovingFromCartLoadingState());
    try {
      Response response=await  http.post(Uri.parse("https://student.valuxapps.com/api/carts"),
          headers: {
            "lang":"en",
            "Authorization":token!
          },
          body: {
            "product_id":productId.toString()
          }
      );
      var responseData=jsonDecode(response.body);
      if(response.statusCode==200){
        if(responseData['status']==true){
          //success
          changeCartData=ChangeCartData.fromJson(responseData['data']['product']);
          await getCarts();
          emit(AddOrRemovingFromCartSuccessState(successMessage: responseData['message']));
        }else{
          cartsId[productId] = !cartsId[productId]!;
          //failed
          emit(AddOrRemovingFromCartFailedState(errorMessage: responseData['message']));
        }
      }
    }  catch (e) {
      cartsId[productId] = !cartsId[productId]!;
      // failed
      emit(AddOrRemovingFromCartFailedState(errorMessage: e.toString()));
    }
  }


///todo:Search Api
//   List<SearchData> searchResult=[];
//   void getProductAfterFiltered({required
//   String input})async{
//     emit(SearchLoadingState());
//   try {
//     Response response =await http.post(Uri.parse("https://student.valuxapps.com/api/products/search"),
//       headers: {
//         "lang":"en",
//         "Authorization":token!,
//       },
//     body: {
//       "text":input
//     },
//     );
//     var responseData=jsonDecode(response.body);
//     if(response.statusCode==200){
//       if(responseData['status']==true){
//         for(var item in responseData['data']['data']) {
//           searchResult.add(SearchData.fromJson(item));
//         }
//         print(searchResult);
//         emit(SearchSuccessState());
//       }else{
//         emit(SearchFailedState(responseData['message']));
//       }
//     }
//   } catch (e) {
//    emit(SearchFailedState(e.toString()));
//   }
//   }








}
