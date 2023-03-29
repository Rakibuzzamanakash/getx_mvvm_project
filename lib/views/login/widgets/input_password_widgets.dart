
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidgets extends StatelessWidget {
   InputPasswordWidgets({Key? key}) : super(key: key);
  final loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewModel.passwordController.value,
      focusNode: loginViewModel.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar("Password", 'Please enter password');
        }
      },
      onFieldSubmitted: (value){
        //  Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        hintText: 'password_hint'.tr,
        border: OutlineInputBorder(),
      ),
    );
  }
}
