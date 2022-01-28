import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/screens/dashboard/dashboard_page.dart';
import 'package:ilearn/screens/dashboard/profile.dart';
import 'package:ilearn/screens/redeem_section/redeem.dart';
import 'package:ilearn/screens/dashboard/validation.dart';
import 'package:ilearn/styling/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int currentIndex = 0;
  bool isSelected = true;
  List<Widget> screens = [
    DashBoard(),
    Validation(),
    Redeem(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: DotNavigationBar(
        borderRadius: 20,
        enableFloatingNavBar: true,
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: currentIndex,
        dotIndicatorColor: Colors.white,
        backgroundColor: Colors.grey[300],
        unselectedItemColor: Colors.grey[300],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          /// Home
          DotNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 0
                  ? 'assets/svgs/icons/homeIcon.svg'
                  : 'assets/svgs/icons/homeIconGrey.svg',
              height: 25,
              width: 25,
            ),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 1
                  ? 'assets/svgs/icons/validationIcon.svg'
                  : 'assets/svgs/icons/validationIconGrey.svg',
              height: 25,
              width: 25,
            ),
          ),

          /// Search
          DotNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 2
                  ? 'assets/svgs/icons/redeemIcon.svg'
                  : 'assets/svgs/icons/redeemIconGrey.svg',
              height: 25,
              width: 25,
            ),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 3
                  ? 'assets/svgs/icons/profileIcon.svg'
                  : 'assets/svgs/icons/profileIconGrey.svg',
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
    );
    // bottomNavigationBar: BottomNavigationBar(
    //   showSelectedLabels: false,
    //   enableFeedback: true,
    //   showUnselectedLabels: false,
    //   backgroundColor: AppColor.black,
    //   currentIndex: currentIndex,
    //   elevation: 0,
    //   onTap: (index) {
    //     setState(() {
    //       currentIndex = index;
    //     });
    //   },
    //   type: BottomNavigationBarType.fixed,
    //   items: [
    //     BottomNavigationBarItem(
    //         icon: SvgPicture.asset(
    //           currentIndex == 0
    //               ? 'assets/svgs/icons/homeIcon.svg'
    //               : 'assets/svgs/icons/homeIconGrey.svg',
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Dashboard'),
    //     BottomNavigationBarItem(
    //         icon: SvgPicture.asset(
    //           currentIndex == 1
    //               ? 'assets/svgs/icons/validationIcon.svg'
    //               : 'assets/svgs/icons/validationIconGrey.svg',
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Validation'),
    //     BottomNavigationBarItem(
    //         icon: SvgPicture.asset(
    //           currentIndex == 2
    //               ? 'assets/svgs/icons/redeemIcon.svg'
    //               : 'assets/svgs/icons/redeemIconGrey.svg',
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Redeem'),
    //     BottomNavigationBarItem(
    //         icon: SvgPicture.asset(
    //           currentIndex == 3
    //               ? 'assets/svgs/icons/profileIcon.svg'
    //               : 'assets/svgs/icons/profileIconGrey.svg',
    //           height: 25,
    //           width: 25,
    //         ),
    //         label: 'Profile'),
    //   ],
    // ),
  }
}
