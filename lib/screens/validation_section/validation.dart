import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/screens/validation_section/certificate_validation.dart';
import 'package:ilearn/screens/validation_section/daily_validation.dart';
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
            toolbarHeight: 0,
            bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              indicatorWeight: 3,
              unselectedLabelColor: AppColor.grey,
              labelColor: AppColor.primaryColor,
              indicatorColor: AppColor.secondaryColor,
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.listAlt),
                  text: 'Daily Task',
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.fileUpload),
                  text: 'Certificate Upload',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DailyValidation(),
              CertificateValidation(),
            ],
          )),
    );
  }
}
