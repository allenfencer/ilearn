import 'package:flutter/material.dart';
import 'package:ilearn/styling/text_styles.dart';

class GiftContainer extends StatelessWidget {
  final Color? giftContainerColor;
  final String? imageNum;
  final String? giftName;
  final int? price;
  const GiftContainer(
      {Key? key,
      this.giftContainerColor,
      required this.imageNum,
      this.price,
      this.giftName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(15),
      height: 300,
      width: 155,
      decoration: BoxDecoration(
        color: giftContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/gifts_images/reward$imageNum.png',
            height: 80,
            width: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            giftName!,
            style: mediumTextStyle,
          ),
          Text(
            price.toString(),
            style: mediumTextStyle,
          ),
        ],
      ),
    );
  }
}
