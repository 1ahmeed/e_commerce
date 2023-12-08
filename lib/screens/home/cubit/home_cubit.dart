import 'dart:convert';
import 'package:e_commerce/core/constant.dart';
import 'package:e_commerce/models/address/address_model.dart';
import 'package:e_commerce/models/banners/banners_data.dart';
import 'package:e_commerce/models/carts/cart_model.dart';
import 'package:e_commerce/models/categories/category_data.dart';
import 'package:e_commerce/models/change_carts/change_cart_data.dart';
import 'package:e_commerce/models/change_favourite/change_favourite_data.dart';
import 'package:e_commerce/models/favourites/favourite_model.dart';
import 'package:e_commerce/models/order/OrderModel.dart';
import 'package:e_commerce/models/order_details/OrderDetailsModel.dart';
import 'package:e_commerce/models/product/products_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit? get(context) => BlocProvider.of(context);

  List<BannersData> bannersData = [];


  void getBanners() async {
    emit(BannersLoadingState());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/banners"),
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          for (var item in responseData['data']) {
            bannersData.add(BannersData.fromJson(item));
          }
          // print(bannersData);
          emit(BannersSuccessState());
        } else {
          ///emit failed
          emit(BannersFailedState(errorMessage: responseData['message']));
        }
      }
    } on Exception catch (e) {
      /// emit failed
      emit(BannersFailedState(errorMessage: e.toString()));
    }
  }

  List<CategoryData> categoryData = [];

  void getCategories() async {
    emit(CategoryLoadingState());
    try {
      Response response = await http.get(
          Uri.parse("https://student.valuxapps.com/api/categories"),
          headers: {"lang": "en"});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          for (var item in responseData['data']['data']) {
            categoryData.add(CategoryData.fromJson(item));
          }
          // print(categoryData);
          emit(CategorySuccessState());
        } else {
          ///emit failed
          emit(CategoryFailedState(errorMessage: responseData['message']));
        }
      }
    } on Exception catch (e) {
      /// emit failed
      emit(CategoryFailedState(errorMessage: e.toString()));
    }
  }

  Map<num, bool> favouritesId = {};
  Map<num, bool> cartsId = {};
  List<ProductsData> productData = [];

  void getProducts() async {
    emit(ProductLoadingState());
    try {
      Response response = await http
          .get(Uri.parse("https://student.valuxapps.com/api/home"), headers: {
        "lang": "en",
        "Authorization": token!,
      });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          for (var item in responseData['data']['products']) {
            productData.add(ProductsData.fromJson(item));
            favouritesId.addAll({item['id']: item['in_favorites']});
            cartsId.addAll({item['id']: item['in_cart']});
          }
          // print("*************");
          // print(favouritesId);
          // print(productData);
          emit(ProductSuccessState());
        } else {
          ///emit failed
          emit(ProductFailedState(errorMessage: responseData['message']));
        }
      }
    } on Exception catch (e) {
      /// emit failed
      emit(ProductFailedState(errorMessage: e.toString()));
    }
  }

  List<ProductsData> productAfterFiltered = [];

  void getProductAfterFiltered({required String input}) {
    productAfterFiltered = productData
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
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
          favouriteModel = FavouritesModel.fromJson(responseData);
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

  void addOrRemoveFromFavourite({required productId}) async {
    favouritesId[productId] = !favouritesId[productId]!;
    emit(AddOrRemovingFromFavouritesLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/favorites"),
          headers: {"lang": "en", "Authorization": token!},
          body: {"product_id": productId.toString()});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          changeFavouriteData =
              ChangeFavouriteData.fromJson(responseData['data']['product']);
          await getFavourites();
          emit(AddOrRemovingFromFavouritesSuccessState(
              successMessage: responseData['message']));
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
  num total = 0;

  Future<void> getCarts() async {
    emit(GetCartLoadingState());
    try {
      Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/carts"),
        headers: {"lang": "en", "Authorization": token!},
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          total = responseData['data']['total'];
          cartModel = CartModel.fromJson(responseData);
          // print(total);
          // print(cartModel);
          emit(GetCartSuccessState());
          //emit success
          //get data
        } else {
          //emit false
          emit(GetCartFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      // print(e.toString());
      // emit false
      emit(GetCartFailedState(errorMessage: e.toString()));
    }
  }

  void addOrRemoveFromCart({required int productId}) async {
    cartsId[productId] = !cartsId[productId]!;
    emit(AddOrRemovingFromCartLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/carts"),
          headers: {"lang": "en", "Authorization": token!},
          body: {"product_id": productId.toString()});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          //success
          changeCartData =
              ChangeCartData.fromJson(responseData['data']['product']);
          // print(responseData['data']['quantity']);
          getCarts();
          emit(AddOrRemovingFromCartSuccessState(
              successMessage: responseData['message']));
        } else {
          cartsId[productId] = !cartsId[productId]!;
          //failed
          emit(AddOrRemovingFromCartFailedState(
              errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      cartsId[productId] = !cartsId[productId]!;
      // failed
      emit(AddOrRemovingFromCartFailedState(errorMessage: e.toString()));
    }
  }

  void updateCart({required int cartId, required int quantity}) async {
    emit(UpdateCartLoadingState());

    try {
      Response response = await http.put(
        Uri.parse("https://student.valuxapps.com/api/carts/$cartId"),
        body: {"quantity": quantity.toString()},
        headers: {"lang": "en", "Authorization": token!},
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          // emit success
          getCarts();
          emit(UpdateCartSuccessState());
        } else {
          // print(responseData['message']);
          ///emit error
          emit(UpdateCartFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      // print(e.toString());
      emit(UpdateCartFailedState(errorMessage: e.toString()));

      ///emit error
    }
  }

  ///address api
  AddressModel? addressModel;

  void getAddresses() async {
    emit(GetAddressLoadingState());
    try {
      Response response = await http.get(
          Uri.parse("https://student.valuxapps.com/api/addresses"),
          headers: {"lang": "en", "Authorization": token!});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          addressModel = AddressModel.fromJson(responseData);
          // print("00000000000000000");
          // print(addressModel!.data!.data![0].name);
          emit(GetAddressSuccessState());
        } else {
          // print(responseData['message']);
          ///emit failed
          emit(GetAddressFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      /// emit failed
      emit(GetAddressFailedState(errorMessage: e.toString()));
    }
  }

  void deleteAddresses({required int addressId}) async {
    emit(DeleteAddressLoadingState());
    try {
      Response response = await http.delete(
          Uri.parse("https://student.valuxapps.com/api/addresses/$addressId"),
          headers: {"lang": "en", "Authorization": token!});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          getAddresses();
          emit(DeleteAddressSuccessState(
              successMessage: responseData['message']));
        } else {
          ///emit failed
          // print(responseData['message']);
          emit(DeleteAddressFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      /// emit failed
      emit(DeleteAddressFailedState(errorMessage: e.toString()));
    }
  }

  Future<void> updateAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required int addressId,
    double? lat,
    double? long,
    String? notes = "",
  }) async {
    emit(UpdateAddressLoadingState());
    try {
      Response response = await http.put(
          Uri.parse("https://student.valuxapps.com/api/addresses/$addressId"),
          body: {
            "name": name,
            "city": city,
            "region": region,
            "details": details,
            "latitude": lat.toString(),
            "longitude": long.toString(),
            "notes": notes ?? "",
          },
          headers: {
            "lang": "en",
            "Authorization": token!
          });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          getAddresses();
          emit(UpdateAddressSuccessState(
              successMessage: responseData['message']));
        } else {
          ///emit failed
          // print(responseData['message']);
          emit(UpdateAddressFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      emit(UpdateAddressFailedState(errorMessage: e.toString()));
    }
  }

  Future<void> addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    double? lat,
    double? long,
    String? notes = "",
  }) async {
    emit(AddAddressLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/addresses"),
          body: {
            "name": name,
            "city": city,
            "region": region,
            "details": details,
            "latitude": lat.toString(),
            "longitude": long.toString(),
            "notes": notes ?? "",
          },
          headers: {
            "lang": "en",
            "Authorization": token!
          });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          getAddresses();
          emit(AddAddressSuccessState(successMessage: responseData['message']));
        } else {
          ///emit failed
          // print(responseData['message']);
          emit(AddAddressFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      emit(AddAddressFailedState(errorMessage: e.toString()));
    }
  }

  ///order api
  Future<void> makeOrder(
      {required int addressId,
      required int payMethod,
      bool userPoint = true}) async {
    emit(AddOrderLoadingState());
    try {
      Response response = await http
          .post(Uri.parse("https://student.valuxapps.com/api/orders"), body: {
        "address_id": addressId.toString(),
        "payment_method": payMethod.toString(),
        "use_points": userPoint.toString(),
      }, headers: {
        "lang": "en",
        "Authorization": token!
      });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          cartsId.forEach((key, value) {
            value = false;
          });
          getProducts();
         getOrders();
          emit(AddOrderSuccessState(successMessage: responseData['message']));
          // getCarts();
        } else {
          ///emit failed
          // print(responseData['message']);
          emit(AddOrderFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      emit(AddOrderFailedState(errorMessage: e.toString()));
    }
  }

  OrderModel? orderModel;

  Future<void> getOrders() async {
    emit(GetOrderLoadingState());
    try {
      Response response = await http.get(
          Uri.parse("https://student.valuxapps.com/api/orders"),
          headers: {"lang": "en", "Authorization": token!});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
          orderModel = OrderModel.fromJson(responseData);
          emit(GetOrderSuccessState());
          // getCarts();
        } else {
          ///emit failed
          print(responseData['message']);
          emit(GetOrderFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(GetOrderFailedState(errorMessage: e.toString()));
    }
  }

  OrderDetailsModel? orderDetailsModel;

  void getOrderDetails({
    required orderId,
  }) async {
    emit(GetOrderDetailsLoadingState());
    // try {
    // } catch (e) {
    //   print(e.toString());
    //   emit(GetOrderDetailsFailedState(errorMessage: e.toString()));
    // }
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/orders/$orderId"),
        headers: {"lang": "en", "Authorization": token!});
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseData['status'] == true) {
        orderDetailsModel = OrderDetailsModel.fromJson(responseData);

        emit(GetOrderDetailsSuccessState());
      } else {
        ///emit failed
        print(responseData['message']);
        emit(GetOrderDetailsFailedState(
            errorMessage: responseData['message']));
      }
    }
  }

  void cancelOrder({required int orderId}) async {
    emit(CancelOrderLoadingState());
    try {
      Response response = await http.get(
          Uri.parse("https://student.valuxapps.com/api/orders/$orderId/cancel"),
          headers: {"lang": "en", "Authorization": token!});
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData['status'] == true) {
           getOrders();

          emit(CancelOrderSuccessState());
        } else {
          ///emit failed
          print(responseData['message']);
          emit(CancelOrderFailedState(errorMessage: responseData['message']));
        }
      }
    } catch (e) {
      print(e.toString());
      emit(CancelOrderFailedState(errorMessage: e.toString()));
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
