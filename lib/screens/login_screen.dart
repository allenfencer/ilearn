import 'package:flutter/material.dart';
import 'package:ilearn/global_widgets/logo_buttons.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
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
                height: 15,
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
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: smallTextStyle,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    fillColor: AppColor.white,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: Image.asset('assets/images/profile.png'),
                    hintStyle: smallTextStyle,
                    hintText: 'Username',
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: smallTextStyle,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    fillColor: AppColor.white,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: Image.asset('assets/images/key-square.png'),
                    suffixIcon: Image.asset('assets/images/Eye-slash.png'),
                    hintStyle: smallTextStyle,
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {},
                minWidth: 150,
                elevation: 0,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Login',
                ),
                color: AppColor.secondaryColor,
                textColor: AppColor.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
