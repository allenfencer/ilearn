import 'package:flutter/material.dart';
import 'package:ilearn/global_widgets/course_buttons.dart';

class ButtonRowOne extends StatelessWidget {
  const ButtonRowOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CourseButton(
          btnTitle: 'Development',
          btnColor: Color(0xff56C2FF),
          imageLoc: 'developmentIcon',
        ),
        CourseButton(
          btnTitle: 'Design',
          btnColor: Color(0xff9BEB3E),
          imageLoc: 'designIcon',
        ),
        CourseButton(
          btnTitle: 'Marketing',
          btnColor: Color(0xffE359F9),
          imageLoc: 'marketingIcon',
        ),
        CourseButton(
          btnTitle: 'Software',
          btnColor: Color(0xffDB6868),
          imageLoc: 'softwareIcon',
        ),
      ],
    );
  }
}
