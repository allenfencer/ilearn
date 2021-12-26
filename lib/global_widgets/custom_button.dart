import 'package:flutter/material.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  const CustomButton({Key? key,required this.btnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: 150,
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        btnText,
        style: btnTextStyle,
      ),
      color: AppColor.secondaryColor,
      textColor: AppColor.black,
    );
  }
}
