import 'package:flutter/material.dart';
import 'package:ilearn/dashboard_components/button_row_one.dart';
import 'package:ilearn/dashboard_components/button_row_two.dart';
import 'package:ilearn/dashboard_components/learn_credit_container.dart';
import 'package:ilearn/global_widgets/course_buttons.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: SizedBox(
            width: _width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Welcome Allen,',
                    style: smallTextStyle,
                  ),
                  LearnCreditContainer(),
                  ButtonRowOne(),
                  SizedBox(
                    height: 15,
                  ),
                  ButtonRowTwo()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
