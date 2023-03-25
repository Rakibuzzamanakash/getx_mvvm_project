
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm_project/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key,
  this.buttonColor = AppColor.blueColor,
    this.textColor = AppColor.whiteColor,
    required this.title,
    required this.onPress,
    this.height = 60,
    this.width = 100,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height,width;
  final VoidCallback onPress;
  final Color textColor,buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: loading ? Center(child: CircularProgressIndicator(),):
      Center(child: Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),),
    );
  }
}
