import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/styling/text_styles.dart';

class CourseButton extends StatelessWidget {
  final String btnTitle;
  final String? imageLoc;
  final Color? btnColor;
  const CourseButton(
      {Key? key, required this.btnTitle, this.imageLoc, this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(18),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: btnColor, borderRadius: BorderRadius.circular(25)),
            child: SvgPicture.asset(
              'assets/svgs/icons/$imageLoc.svg',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            btnTitle,
            style: courseButtonTextStyle,
          )
        ],
      ),
    );
  }
}
