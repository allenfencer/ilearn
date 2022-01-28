import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/styling/text_styles.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
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
                // const SizedBox(
                //   height: 10,
                // ),
                const Center(
                  child: Text(
                    'User',
                    style: headingStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Flutter Developer | Tech Enthusiast',
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
                      children: const [
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
                            '1.234',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromRGBO(237, 180, 38, 1.0),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
                    Column(
                      children: const [
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
                            '46/100',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromRGBO(237, 180, 38, 1.0),
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
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
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
    );
  }
}
