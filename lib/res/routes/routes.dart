import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';
import 'package:getx_mvvm_project/views/splash_screen.dart';

class AppRoutes {

  static appRoutes () => [
    GetPage(
        name: RouteName.splashScreen,
        page:() => SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    ),
  ];
}