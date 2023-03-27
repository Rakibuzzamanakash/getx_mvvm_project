
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/components/round_button.dart';
import 'package:getx_mvvm_project/utils/utils.dart';
import 'package:getx_mvvm_project/view_models/controller/login/login_view_model.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);

  final loginViewModel = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginViewModel.emailController.value,
                    focusNode: loginViewModel.emailFocusNode.value,
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snackBar("Email", 'Please enter email');
                      }
                    },
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Obx(() => RoundButton(
              title: 'login'.tr,
              loading: loginViewModel.loading.value,
              onPress: (){
                if(_formkey.currentState!.validate()){
                  loginViewModel.loginApi();
                }
              },
              width: 200,)),
          ],
        ),
      ),
    );
  }
}
