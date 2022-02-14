import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/services/database.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CertificateValidation extends StatefulWidget {
  const CertificateValidation({Key? key}) : super(key: key);

  @override
  State<CertificateValidation> createState() => _CertificateValidationState();
}

class _CertificateValidationState extends State<CertificateValidation> {
  TextEditingController urlController = TextEditingController();
  TextEditingController courseController = TextEditingController();

  File? image1;
  File? image2;

  Future getImage() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image1 == null) {
        return;
      } else {
        final tempImage = File(image1.path);
        setState(() {
          this.image1 = tempImage;
        });
      }
    } on PlatformException catch (e) {
      Get.snackbar('Failed to pick Image', e.toString());
    }
  }

  Future getImageFromGallery() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image2 == null) {
        return;
      } else {
        final tempImage = File(image2.path);
        setState(() {
          this.image2 = tempImage;
        });
      }
    } on PlatformException catch (e) {
      Get.snackbar('Failed to pick Image', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AnimationLimiter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 400),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Text(
                    validationMsg1,
                    style: colouredBoldTextStyle(Color(0xff6A6A6A), 15),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: TextFormField(
                    controller: courseController,
                    keyboardType: TextInputType.text,
                    style: colouredNormalTextStyle(AppColor.primaryColor, 15),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          courseController.clear();
                        },
                        child: Icon(
                          Icons.book_rounded,
                          size: 20,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      fillColor: Color(0xffEAEAEA),
                      filled: true,
                      border: InputBorder.none,
                      hintStyle: colouredBoldTextStyle(AppColor.grey, 15),
                      hintText: 'Enter Course Name',
                    ),
                  ),
                ),

                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: TextFormField(
                    controller: urlController,
                    keyboardType: TextInputType.text,
                    style: colouredNormalTextStyle(AppColor.primaryColor, 15),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          urlController.clear();
                        },
                        child: Icon(
                          Icons.add_link_rounded,
                          size: 20,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      fillColor: Color(0xffEAEAEA),
                      filled: true,
                      border: InputBorder.none,
                      hintStyle: colouredBoldTextStyle(AppColor.grey, 15),
                      hintText: 'Enter Certificate url for validation',
                    ),
                  ),
                ),
                image2 != null
                    ? Container(
                        margin: EdgeInsets.fromLTRB(15, 12, 15, 0),
                        clipBehavior: Clip.antiAlias,
                        // alignment: Alignment.topCenter,
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            style: BorderStyle.solid,
                            color: Color(0xff00BCF2),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(image2!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: getImageFromGallery,
                        child: Container(
                          height: 230,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffE2F3FA),
                            border: Border.all(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color(0xff00BCF2),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 80,
                                color: Color(0xff00BCF2),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Upload you certificates here',
                                style:
                                    colouredBoldTextStyle(AppColor.black, 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Browse Files',
                                style: colouredBoldTextStyle(
                                  Color(0xff00BCF2),
                                  15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                image1 != null
                    ? Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        clipBehavior: Clip.antiAlias,
                        // alignment: Alignment.topCenter,
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              style: BorderStyle.solid,
                              color: Color(0xffF29A31)),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(image1!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: getImage,
                        child: Container(
                          height: 230,
                          margin: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffFFE7C3),
                            border: Border.all(
                                width: 3,
                                style: BorderStyle.solid,
                                color: Color(0xffF29A31)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 80,
                                color: Color(0xffF29A31),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Upload you certificates here',
                                style:
                                    colouredBoldTextStyle(AppColor.black, 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Capture',
                                style: colouredBoldTextStyle(
                                  Color(0xffF29A31),
                                  15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Consumer<UserModel>(builder: (context, student, child) {
                  return Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (courseController.text.isNotEmpty &&
                            (urlController.text.isNotEmpty ||
                                image1 != null ||
                                image2 != null)) {
                          StudentDatabaseService(uid: student.uid)
                              .updateCertificateData(
                                  certificateUrl: urlController.text,
                                  course: courseController.text);
                          Get.snackbar('Cretificate Uploaded',
                              '${courseController.text} certificate has been added');
                          setState(() {
                            image1 = null;
                            image2 = null;
                            urlController.clear();
                            courseController.clear();
                          });
                        } else {
                          Get.snackbar(
                              'Error', 'Complete all fields with valid data');
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffDDEAC4)),
                        alignment: Alignment.center,
                        child: Text(
                          'UPLOAD TO CLOUD',
                          style: colouredBoldTextStyle(Color(0xff00BB34), 16),
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
