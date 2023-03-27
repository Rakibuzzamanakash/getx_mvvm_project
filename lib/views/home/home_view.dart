
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';
import 'package:getx_mvvm_project/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

   UserPreference userPreference = UserPreference();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              }, 
              icon: Icon(Icons.logout)
          )
        ],
      ),
    );
  }
}
