import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/models/gift_tile_model.dart';
import 'package:ilearn/models/student.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/screens/redeem_section/gift_tile.dart';
import 'package:ilearn/services/database.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';
import 'package:provider/provider.dart';

class Redeem extends StatelessWidget {
  const Redeem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        title: Consumer<UserModel>(
          builder: (context, student, child) {
            return StreamBuilder<StudentData>(
                stream:
                    StudentDatabaseService(uid: student.uid).studentDataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final studentData = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Available Credits: ${studentData!.credits} ',
                          style: colouredBoldTextStyle(
                              AppColor.secondaryColor, 18),
                        ),
                        SvgPicture.asset(
                          'assets/svgs/logo/lc.svg',
                          height: 22,
                          width: 22,
                        )
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                });
          },
        ),
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Icon(
              Icons.person,
              color: AppColor.grey,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                AnimationLimiter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: GiftTileModel.redeemGifts.length,
                      itemBuilder: (BuildContext context, index) {
                        GiftTileModel giftData =
                            GiftTileModel.redeemGifts[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: GiftTile(
                                imageNumber: giftData.imageNumber.toString(),
                                itemName: giftData.giftName.toString(),
                                itemCredit: giftData.price.toString(),
                                tileColor: giftData.giftContainerColor,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         mainAxisSpacing: 10,
                //         crossAxisSpacing: 15),
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: GiftTileModel.redeemGifts.length,
                //     shrinkWrap: true,
                //     itemBuilder: (BuildContext context, int index) {
                //       GiftTileModel gift = GiftTileModel.redeemGifts[index];
                //       return GiftContainer(
                //         giftContainerColor: gift.giftContainerColor,
                //         imageNum: gift.imageNumber,
                //         giftName: gift.giftName,
                //         price: gift.price,
                //       );
                //     }),