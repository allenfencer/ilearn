import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/screens/validation_section/certificate_validation.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class Validation extends StatelessWidget {
  const Validation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: AppColor.white,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            elevation: 0,
            title: Text(
              'Validation',
              style: colouredBoldTextStyle(AppColor.primaryColor, 22),
            ),
            bottom: TabBar(
              indicatorWeight: 3,
              indicatorColor: Color(0xff03DAC6),
              tabs: [
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.book,
                  ),
                  text: 'Daily Validation',
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.check,
                  ),
                  text: 'Certificate Validation',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CertificateValidation(),
              CertificateValidation(),
            ],
          )),
    );
  }
}
