import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ilearn/dashboard_components/button_row_one.dart';
import 'package:ilearn/dashboard_components/button_row_two.dart';
import 'package:ilearn/dashboard_components/challenge_containers.dart';
import 'package:ilearn/dashboard_components/learn_credit_container.dart';
import 'package:ilearn/models/student.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/services/database.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/strings.dart';
import 'package:ilearn/styling/text_styles.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: SizedBox(
            width: _width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Consumer<UserModel>(
                builder: (context, student, child) {
                  return StreamBuilder<StudentData>(
                    stream: StudentDatabaseService(uid: student.uid)
                        .studentDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final studentData = snapshot.data;

                        return AnimationLimiter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 275),
                              childAnimationBuilder: (widget) =>
                                  FadeInAnimation(
                                child: ScaleAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                Text(
                                  'Dashboard',
                                  style: headingStyle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Welcome ${studentData!.username},',
                                  style: smallTextStyle,
                                ),
                                LearnCreditContainer(
                                  credits: studentData.credits,
                                  streak: studentData.streak,
                                ),
                                ButtonRowOne(),
                                SizedBox(
                                  height: 15,
                                ),
                                ButtonRowTwo(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Challenges',
                                  style:
                                      colouredBoldTextStyle(AppColor.black, 24),
                                ),
                                ChallengeContainers(),
                                //QUOTE FOR THE DAY CONTAINER
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  clipBehavior: Clip.antiAlias,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffFCF1D6)),
                                  margin: EdgeInsets.symmetric(vertical: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'QUOTE FOR THE DAY',
                                        style: colouredBoldTextStyle(
                                            AppColor.primaryColor, 20),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        quotes[2],
                                        style: colouredNormalTextStyle(
                                            AppColor.black, 14),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
