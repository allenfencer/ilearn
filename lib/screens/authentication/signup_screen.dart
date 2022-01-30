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
import 'package:ilearn/screens/authentication/login_screen.dart';
import 'package:ilearn/services/auth.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
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
                    InkWell(
                      onTap: () async {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
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
                          if (kDebugMode) {
                            print(result);
                          }
                          Get.offAll(HomePage());
                        } catch (e) {
                          Get.snackbar('Error Signing Up', e.toString());
                        }
                      },
                      child: LogoButton(
                        btnText: 'Google',
                        btnImagePath: 'googleLogo.svg',
                        btnColor: AppColor.grey,
                        btnTextColor: AppColor.white,
                      ),
                    ),
                    LogoButton(
                      btnText: 'Microsoft',
                      btnImagePath: 'microsoft-icon.svg',
                      btnColor: AppColor.white,
                      btnTextColor: AppColor.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                NameTextField(
                  hintText: 'Username',
                  imagePath: 'profile.png',
                  validator: (value) => value!.length > 2
                      ? null
                      : 'Username should be of min 3 character',
                  controller: userNameController,
                ),
                NameTextField(
                  hintText: 'Email',
                  imagePath: 'sms.png',
                  validator: (value) =>
                      value!.isEmail ? null : 'Enter a valid email',
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                PasswordTextField(
                  passwordController: passwordController,
                  validator: (value) => value!.length > 5
                      ? null
                      : 'Enter a password of min 6 character',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  btnText: 'Register',
                  callback: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth.signUpUsingEmail(
                            emailController.text, passwordController.text,
                            username: userNameController.text);
                        if (kDebugMode) {
                          print(result);
                        }
                        if (result != null) {
                          Get.offAll(HomePage());
                        }
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
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
                              Get.off(LoginScreen());
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
