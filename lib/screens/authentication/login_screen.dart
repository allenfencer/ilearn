import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilearn/global_widgets/custom_button.dart';
import 'package:ilearn/global_widgets/logo_buttons.dart';
import 'package:ilearn/global_widgets/name_textfield.dart';
import 'package:ilearn/global_widgets/password_textfield.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/screens/dashboard/homepage.dart';
import 'package:ilearn/screens/authentication/signup_screen.dart';
import 'package:ilearn/services/auth.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
  String error = '';
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
                loginMsg,
                style: headingStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                signIn,
                style: smallTextStyle,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          });
                      try {
                        UserModel result = await _auth.signInUsingGoogle();
                        if (result == null) {
                          setState(() {
                            error = 'Could not Sign In with Google';
                          });
                        } else {
                          Get.offAll(HomePage());
                        }
                      } catch (e) {}
                    },
                    child: LogoButton(
                      btnText: 'Google',
                      btnImagePath: 'googleLogo.svg',
                      btnColor: AppColor.grey,
                    ),
                  ),
                  LogoButton(
                    btnText: 'Microsoft',
                    btnImagePath: 'msftLogo.svg',
                    btnColor: AppColor.white,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              NameTextField(
                hintText: 'Email',
                imagePath: 'sms.png',
                controller: emailController,
              ),
              PasswordTextField(
                passwordController: passwordController,
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                btnText: 'Login',
                callback: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {});
                    dynamic result = await _auth.signInUsingMail(
                        emailController.text, passwordController.text);
                    if (result == null) {
                      setState(() {
                        error = 'Could not Sign In with the Credentials';
                        if (kDebugMode) {
                          print(error);
                        }
                      });
                    } else {
                      Get.offAll(() => HomePage());
                    }
                  }
                },
              ),
              SizedBox(
                height: 45,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account yet? ',
                      style: smallTextStyle,
                      children: [
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(SignUp());
                          })
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
