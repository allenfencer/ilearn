import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class GiftTile extends StatelessWidget {
  final Color? tileColor;
  final String itemName;
  final String imageNumber;
  final String itemCredit;
  const GiftTile(
      {Key? key,
      required this.imageNumber,
      required this.itemName,
      required this.itemCredit,
      this.tileColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    itemName,
                    style: boldTextStyle(
                      AppColor.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          fixedSize: Size(120, 50),
                          padding: EdgeInsets.all(10),
                          backgroundColor: Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$itemCredit ',
                            style: boldTextStyle(
                              AppColor.secondaryColor,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svgs/logo/lc.svg',
                            height: 22,
                            width: 22,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          Container(
            width: 140,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Image.asset(
              'assets/gifts_images/reward$imageNumber.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
