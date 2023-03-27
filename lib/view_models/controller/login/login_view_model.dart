import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/models/login/user_model.dart';
import 'package:getx_mvvm_project/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';
import 'package:getx_mvvm_project/utils/utils.dart';
import 'package:getx_mvvm_project/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {


  final _api = LoginRepository();

  UserPreference userPreference =UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs ;

  void loginApi () {
    loading.value = true;
    Map data = {
      'email' : emailController.value.text,
      'password' : passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      userPreference.saveUser(UserModel.fromJson(value)).then((value) {
        Get.toNamed(RouteName.homeView);
      }).onError((error, stackTrace) {

      });
      Utils.snackBar('Login', 'Login Successfully');
    }).onError((error, stackTrace){
      loading.value = false;
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackBar('Error', error.toString());
    });
  }
}