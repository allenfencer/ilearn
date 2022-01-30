import 'package:flutter/material.dart';
import 'package:ilearn/global_widgets/course_buttons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ButtonRowOne extends StatelessWidget {
  const ButtonRowOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 400),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FlipAnimation(
            child: widget,
          ),
        ),
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
      ),
    ));
  }
}
