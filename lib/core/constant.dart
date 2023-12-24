import 'package:intl/intl.dart';

import 'component/custom_navigation_and_finish.dart';
import 'local_data.dart';
import '../screens/auth_screen/login_screen.dart';

String? token;
String? currentPassword;


void signOut(context) {
  CacheNetwork.removeData(key: 'token').then((value){
    if(value==true){
      navigatorAndFinish(context, LoginScreen());
    }
  });
}

bool checkArabic() {
  return Intl.getCurrentLocale() == 'ar';
}