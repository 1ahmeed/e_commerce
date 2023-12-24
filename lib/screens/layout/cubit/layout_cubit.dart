import 'package:e_commerce/screens/category/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/local_data.dart';
import '../../cart/cart_screen.dart';
import '../../favourite/favourite_screen.dart';
import '../../home/home_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit? get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget>? screens = [
     const HomeScreen(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const CartScreen(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }


  bool isArabic=false;
  void changeLang({bool? fromShared}){
    if(fromShared != null){
      isArabic =fromShared;
      emit(ChangeLangSuccessState());
    }else {
      isArabic =  !isArabic;
    }
    CacheNetwork.insertIntoCache(key: "isArabic", value: isArabic).
    then((value) {
      emit(ChangeLangSuccessState());

    });
  }
}
