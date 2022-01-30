import 'package:flutter/material.dart';
import 'package:ilearn/styling/text_styles.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {Key? key, required this.passwordController, required this.validator})
      : super(key: key);
  final FormFieldValidator<String> validator;

  final TextEditingController passwordController;
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;

  void showPassword() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: widget.validator,
        style: smallTextStyle,
        controller: widget.passwordController,
        obscureText: isObscure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          fillColor: Color(0xffF2F2F2),
          filled: true,
          border: InputBorder.none,
          prefixIcon: Image.asset('assets/images/key-square.png'),
          suffixIcon: GestureDetector(
            onTap: showPassword,
            child: Image.asset('assets/images/Eye-slash.png'),
          ),
          hintStyle: smallTextStyle,
          hintText: 'Password',
        ),
      ),
    );
  }
}
