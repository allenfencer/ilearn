import 'package:flutter/material.dart';
import 'package:ilearn/styling/colors.dart';

const TextStyle headingStyle = TextStyle(
  fontSize: 24,
  color: AppColor.primaryColor,
  fontWeight: FontWeight.w700,
  wordSpacing: 1,
);

const TextStyle smallTextStyle = TextStyle(
  fontSize: 14,
  color: Color(0xff989898),
  fontWeight: FontWeight.w400,
  wordSpacing: 1,
);

const TextStyle btnTextStyle = TextStyle(
  fontSize: 18,
  color: AppColor.black,
  fontWeight: FontWeight.w600,
  wordSpacing: 1,
);

TextStyle boldTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.8,
  );
}

const TextStyle mediumTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.white);

const TextStyle courseButtonTextStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black45);
