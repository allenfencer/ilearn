import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/styling/colors.dart';

class LogoButton extends StatelessWidget {
  final Color? btnColor;
  final Color? btnTextColor;
  final String btnText;
  final String? btnImagePath;
  final VoidCallback? callback;

  const LogoButton(
      {Key? key,
      this.callback,
      this.btnColor,
      this.btnTextColor,
      required this.btnText,
      this.btnImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 60,
      width: 130,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(5, 3))
        ],
        borderRadius: BorderRadius.circular(20),
        color: btnColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/logo/$btnImagePath',
            height: 25,
            width: 25,
            alignment: Alignment.topCenter,
          ),
          Text(
            btnText,
            style: TextStyle(
                fontSize: 16, color: btnTextColor ?? Color(0xffAAAAAA)),
          ),
        ],
      ),
    );
  }
}
