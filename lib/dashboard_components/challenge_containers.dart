import 'package:flutter/material.dart';
import 'package:ilearn/styling/text_styles.dart';

class ChallengeContainers extends StatelessWidget {
  const ChallengeContainers({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    List<String> days = ['21', '50', '100', '200', '365'];

    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              child: Container(
                width: 150,
                height: 120,
                margin: EdgeInsets.only(top: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Color(0xff03DAC6)),
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff142F43)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      days[index],
                      style: colouredBoldTextStyle(Color(0xff03DAC6), 50),
                    ),
                    Text(
                      'days',
                      style: colouredBoldTextStyle(Color(0xff03DAC6), 18),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
