import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';
import 'package:getx_mvvm_project/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {

  UserPreference userPreference = UserPreference();


  
  void isLogin(){
    userPreference.getUser().then((value) {

      // if(value.isLogin == false || value.isLogin.toString() == 'null'){
      //   Timer(const Duration(seconds: 3),
      //           () => Get.toNamed(RouteName.loginView)
      //   );
      // }else{
      //   Timer(const Duration(seconds: 3),
      //           () => Get.toNamed(RouteName.homeView)
      //   );
      // }
      if(value.token!.isEmpty || value.token.toString() == 'null'){
        Timer(const Duration(seconds: 3),
                () => Get.toNamed(RouteName.loginView)
        );
      }else{
        Timer(const Duration(seconds: 3),
                () => Get.toNamed(RouteName.homeView)
        );
      }
    });


  }
}