import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class LearnCreditContainer extends StatelessWidget {
  const LearnCreditContainer({Key? key, required this.credits})
      : super(key: key);
  final int credits;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Learn Credits',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svgs/logo/lc.svg'),
              SizedBox(
                width: 5,
              ),
              Text(
                credits.toString(),
                style: mediumTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
