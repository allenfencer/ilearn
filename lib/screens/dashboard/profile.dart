import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/styling/text_styles.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/logo/pageUnderConstruction.svg',
                height: 200,
                width: 300,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'This page is under development.',
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
              )
            ]),
      ),
    ));
  }
}
