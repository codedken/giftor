import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/rounded_circle_group.dart';
import '../widgets/stacked_circle.dart';
import '../widgets/login_card.dart';

import '../constants_and_methods.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    double bottomPadding = 0;

    if (MediaQuery.of(context).viewInsets.bottom > 100) {
      // keyboard is open
      bottomPadding = MediaQuery.of(context).viewInsets.bottom - 120.0;
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff0A0616),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff0A0616),
                ),
                child: Image.asset(
                  'assets/images/personwithgift.png',
                  width: 1065.7,
                  height: 837.3,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  color: Color(0xff000000).withOpacity(0.4),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              right: 12.0,
              left: 12.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedCircleGroup(
                    primaryColor: Color(0xff4563AF),
                    pointColor: Color(0xffffffff),
                  ),
                  RoundedCircleGroup(
                    primaryColor: Color(0xffAF455F),
                    pointColor: Color(0xffffffff),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16.0,
              right: 12,
              left: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedCircleGroup(
                    primaryColor: Color(0xffAF455F),
                    pointColor: Color(0xffffffff),
                  ),
                  RoundedCircleGroup(
                    primaryColor: Color(0xff4563AF),
                    pointColor: Color(0xffffffff),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 220.0,
              child: StackedCircle(
                pointColor: Color(0xff4563AF),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text(
                      kAppName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 54,
                        fontFamily: 'Lobster',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 120.0,
              top: 150.0,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 800),
                curve: Curves.bounceInOut,
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: LoginCard(),
              ),
            ),
            Positioned(
              bottom: 100.0,
              child: Text(
                'Made with ❤ by Kencode',
                style: kAuthFooterTextStyle,
              ),
            ),
            Positioned(
              bottom: 70.0,
              child: Text(
                'Copyright @ 2021',
                style: kAuthFooterTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
