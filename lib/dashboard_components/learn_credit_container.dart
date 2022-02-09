import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class LearnCreditContainer extends StatelessWidget {
  const LearnCreditContainer(
      {Key? key, required this.credits, required this.streak})
      : super(key: key);
  final int credits;
  final int streak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Streak',
                  style: colouredBoldTextStyle(AppColor.white, 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🔥',
                      style: colouredNormalTextStyle(null, 25),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      streak.toString(),
                      style: colouredBoldTextStyle(AppColor.white, 25),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your\niLearn Credits',
                  style: colouredBoldTextStyle(AppColor.white, 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
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
                      style: colouredBoldTextStyle(AppColor.white, 25),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
