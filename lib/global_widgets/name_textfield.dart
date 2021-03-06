import 'package:flutter/material.dart';
import 'package:ilearn/styling/text_styles.dart';

class NameTextField extends StatelessWidget {
  final String hintText;
  final String imagePath;
  final TextEditingController controller;
  final TextInputType? inputType;
  final FormFieldValidator<String> validator;
  const NameTextField({
    Key? key,
    required this.hintText,
    this.inputType,
    required this.imagePath,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: inputType ?? TextInputType.name,
        style: smallTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          fillColor: Color(0xffF2F2F2),
          filled: true,
          border: InputBorder.none,
          prefixIcon: Image.asset('assets/images/$imagePath'),
          hintStyle: smallTextStyle,
          hintText: hintText,
        ),
      ),
    );
  }
}
