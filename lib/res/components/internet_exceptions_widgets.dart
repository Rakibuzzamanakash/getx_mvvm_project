import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/colors/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key , required this.onPress}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .1,),
          Icon(Icons.cloud_off, color: AppColor.redColor,size: 30,),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text('internet_exception'.tr,textAlign: TextAlign.center,),
            ),
          ),
          SizedBox(height: height * .15,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.blueColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(child: Text('Retry',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}
