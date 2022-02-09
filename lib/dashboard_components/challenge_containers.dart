import 'package:flutter/material.dart';
import 'package:ilearn/styling/text_styles.dart';

class ChallengeContainers extends StatelessWidget {
  const ChallengeContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> days = ['21', '50', '100', '200', '365'];
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return Container(
              width: 150,
              height: 120,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff142F43)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    days[index],
                    style: colouredBoldTextStyle(Color(0xff03DAC6), 45),
                  ),
                  Text(
                    'days',
                    style: colouredBoldTextStyle(Color(0xff03DAC6), 18),
                  )
                ],
              ),
            );
          }),
    );
  }
}
