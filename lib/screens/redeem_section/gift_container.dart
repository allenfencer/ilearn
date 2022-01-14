import 'package:flutter/material.dart';

class GiftContainer extends StatelessWidget {
  final Color? giftContainerColor;
  final String? imageNum;
  const GiftContainer(
      {Key? key, this.giftContainerColor, required this.imageNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 150,
      alignment: Alignment.center,
      width: 155,
      decoration: BoxDecoration(
        color: giftContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        'assets/gifts_images/reward$imageNum.png',
        height: 130,
        width: 130,
      ),
    );
  }
}
