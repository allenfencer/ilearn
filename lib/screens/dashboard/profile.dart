import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/screens/authentication/login_screen.dart';
import 'package:ilearn/services/auth.dart';
import 'package:ilearn/services/database.dart';
import 'package:ilearn/styling/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:ilearn/models/student.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, student, child) {
        return StreamBuilder<StudentData>(
          stream: StudentDatabaseService(uid: student.uid).studentDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final studentData = snapshot.data;
              return Scaffold(
                extendBody: true,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: AnimationLimiter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 200),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Icon(
                                    Icons.person_outline_rounded,
                                    size: 75,
                                    color: Color.fromRGBO(237, 180, 38, 1.0),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  studentData!.username,
                                  style: headingStyle,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  studentData.about,
                                  style: smallTextStyle,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          'LEARN CREDITS',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          studentData.credits.toString(),
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color.fromRGBO(
                                                  237, 180, 38, 1.0),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 0)),
                                  Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          'DAY STREAK',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          studentData.streak.toString() +
                                              '/100',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color.fromRGBO(
                                                  237, 180, 38, 1.0),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Card(
                                child: ListTile(
                                  leading: Icon(Icons.person_outline_rounded),
                                  title: Text('My Account'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Card(
                                child: ListTile(
                                  leading: Icon(Icons.history),
                                  title: Text('Purchase History'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Card(
                                child: ListTile(
                                  leading: Icon(Icons.help_outline_outlined),
                                  title: Text('Help & Support'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Card(
                                child: ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text('Settings'),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  _auth.signOut();
                                  Get.offAll(() => LoginScreen());
                                },
                                child: const Card(
                                  child: ListTile(
                                    leading: Icon(Icons.logout),
                                    title: Text('Logout'),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
