import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:getx_mvvm_project/res/components/round_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter email'.tr),
      ),
      body:  Column(
        children: [
          //InternetExceptionWidget(onPress: () {  },),
          RoundButton(title: 'Login', onPress: (){

          })
        ],
      ),
    );
  }
}
