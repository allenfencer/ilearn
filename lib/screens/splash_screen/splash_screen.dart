import 'package:flutter/material.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/screens/authentication/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loginScreen();
    super.initState();
  }

  _loginScreen() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/logo/logo.svg',
              height: 150,
              width: 130,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: AppColor.secondaryColor,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
