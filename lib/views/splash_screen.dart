import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:getx_mvvm_project/res/components/round_button.dart';
import 'package:getx_mvvm_project/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('welcome_back'.tr,textAlign: TextAlign.center,)),
        ],
      ),
    );
  }
}
