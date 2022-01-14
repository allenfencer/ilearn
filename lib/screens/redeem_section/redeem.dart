import 'package:flutter/material.dart';
import 'package:ilearn/models/gift_tile_model.dart';
import 'package:ilearn/styling/text_styles.dart';
import 'gift_container.dart';

class Redeem extends StatelessWidget {
  const Redeem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Claim your rewards!!! 🥳',
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: GiftTileModel.redeemGifts.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        GiftTileModel gift = GiftTileModel.redeemGifts[index];
                        return GiftContainer(
                          giftContainerColor: gift.giftContainerColor,
                          imageNum: gift.imageNumber,
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
