import 'package:flutter/material.dart';

import '../widgets/rounded_circle_group.dart';
import '../widgets/stacked_circle.dart';
import '../widgets/auth_button.dart';

import './screens.dart';

import '../constants_and_methods.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0616),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 100.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xff0A0616),
                image: DecorationImage(
                  image: AssetImage('assets/gifs/animatedexchange.gif'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                    Colors.black87,
                    BlendMode.darken,
                  ),
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
              top: 40.0,
              child: StackedCircle(
                pointColor: Color(0xffAF455F),
              ),
            ),
            Positioned(
              bottom: 350.0,
              child: StackedCircle(
                pointColor: Color(0xff4563AF),
              ),
            ),
            Positioned(
              top: 200.0,
              child: Container(
                width: getAuthContainerWidth(context),
                margin: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                ),
                child: Column(
                  children: [
                    Text(
                      kAppName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'Lobster',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Spread love by exchanging gifts with one another',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Kodchasan',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 120.0,
              child: Container(
                width: getAuthContainerWidth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AuthButton(
                      btnColor: Color(0xff1323B4),
                      btnText: 'SIGN IN',
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    AuthButton(
                      btnColor: Color(0xffBE123C),
                      btnText: 'REGISTER',
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        RegisterScreen.routeName,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
