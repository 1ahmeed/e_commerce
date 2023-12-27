import 'package:e_commerce/core/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'block_observer.dart';
import 'core/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.init();
  token = CacheNetwork.getData(key: "token");
  currentPassword = CacheNetwork.getData(key: "password");
  runApp(MyApp());
}
