import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/global_widgets/custom_button.dart';
import 'package:ilearn/global_widgets/logo_buttons.dart';
import 'package:ilearn/global_widgets/name_textfield.dart';
import 'package:ilearn/global_widgets/password_textfield.dart';
import 'package:ilearn/screens/homepage.dart';
import 'package:ilearn/screens/login_screen.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                registerMsg,
                style: headingStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                signUp,
                style: smallTextStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LogoButton(
                    btnText: 'Google',
                    btnImagePath: 'googleLogo.svg',
                    btnColor: AppColor.white,
                  ),
                  LogoButton(
                    btnText: 'Facebook',
                    btnImagePath: 'fbLogo.svg',
                    btnColor: AppColor.primaryColor,
                    btnTextColor: AppColor.white,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              NameTextField(
                hintText: 'Username',
                imagePath: 'profile.png',
              ),
              NameTextField(
                hintText: 'Email',
                imagePath: 'sms.png',
                inputType: TextInputType.emailAddress,
              ),
              PasswordTextField(),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                btnText: 'Register',
                callback: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              ),
              SizedBox(
                height: 45,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: smallTextStyle,
                      children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          })
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
