import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilearn/styling/colors.dart';
import 'package:ilearn/styling/text_styles.dart';

class Validation extends StatelessWidget {
  const Validation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: TextFormField(
                      controller: null,
                      keyboardType: TextInputType.text,
                      style: smallTextStyle,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.send_sharp,
                            size: 20,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                        fillColor: AppColor.white,
                        filled: true,
                        border: InputBorder.none,
                        hintStyle: smallTextStyle,
                        hintText: 'Enter certificate url for validation',
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svgs/logo/pageUnderConstruction.svg',
                    height: 200,
                    width: 300,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'This page is under development.',
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
          ),
        ));
  }
}
