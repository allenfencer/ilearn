import 'package:flutter/material.dart';
import 'package:ilearn/global_widgets/course_buttons.dart';

class ButtonRowTwo extends StatelessWidget {
  const ButtonRowTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CourseButton(
          btnTitle: 'Photography',
          btnColor: Color(0xffA385FA),
          imageLoc: 'photographyIcon',
        ),
        CourseButton(
          btnTitle: 'Music',
          btnColor: Color(0xffF361B0),
          imageLoc: 'musicIcon',
        ),
        CourseButton(
          btnTitle: 'Business',
          btnColor: Color(0xffF59D0E),
          imageLoc: 'businessIcon',
        ),
        CourseButton(
          btnTitle: 'Language',
          btnColor: Color(0xff4463F3),
          imageLoc: 'languageIcon',
        ),
      ],
    );
  }
}
