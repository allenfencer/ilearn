import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/services/database.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';
import 'package:provider/provider.dart';

class DailyValidation extends StatelessWidget {
  const DailyValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController socialMediaUrl = TextEditingController();
    TextEditingController descController = TextEditingController();
    descController.text = '';
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //PAGE DESCRIPTION
              Container(
                alignment: Alignment.center,
                color: Colors.grey[200],
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  validationMsg2,
                  style: colouredBoldTextStyle(Color(0xff6A6A6A), 15),
                ),
              ),
              //LEARNING DESCRIPTION CONTAINER
              Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.only(top: 15, left: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFCF1D6)),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What did you learn today?',
                      style: colouredBoldTextStyle(AppColor.primaryColor, 16),
                    ),
                    TextField(
                      style:
                          TextStyle(fontSize: 16, color: AppColor.primaryColor),
                      keyboardType: TextInputType.text,
                      controller: descController,
                      cursorHeight: 25,
                      minLines: 7,
                      maxLines: 12,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, bottom: 5),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xffFCF1D6)),
                    ),
                  ],
                ),
              ),
              //SOCIAL MEDIA TEXT EDITING CONTROLLER
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextFormField(
                  controller: socialMediaUrl,
                  keyboardType: TextInputType.text,
                  style: colouredNormalTextStyle(AppColor.primaryColor, 15),
                  decoration: InputDecoration(
                    suffixIcon:
                        Consumer<UserModel>(builder: (context, student, child) {
                      return GestureDetector(
                        onTap: () async {
                          if (socialMediaUrl.text.isNotEmpty) {
                            StudentDatabaseService(uid: student.uid)
                                .updateStreakData(
                                    postUrl: socialMediaUrl.text,
                                    desc: descController.text);
                            Get.snackbar('Streak  Updated',
                                'Another successful day champ!');
                            socialMediaUrl.clear();
                            descController.clear();
                          } else {
                            Get.snackbar('Error', 'Ivalid Url');
                          }
                        },
                        child: Icon(
                          Icons.send_sharp,
                          size: 20,
                          color: AppColor.primaryColor,
                        ),
                      );
                    }),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    fillColor: Color(0xffEAEAEA),
                    filled: true,
                    border: InputBorder.none,
                    hintStyle: colouredBoldTextStyle(AppColor.grey, 15),
                    hintText: 'Social Media post link',
                  ),
                ),
              ),
              
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
