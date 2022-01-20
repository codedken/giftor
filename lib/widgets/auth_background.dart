import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets.dart';
import '../constants_and_methods.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  AuthBackground(this.child);

  @override
  Widget build(BuildContext context) {
    double bottomPadding = 0;

    if (MediaQuery.of(context).viewInsets.bottom > 100) {
      // keyboard is open
      bottomPadding = MediaQuery.of(context).viewInsets.bottom - 120.0;
    } else {
      kShowBottomStatusBar;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Hero(
                tag: 'auth-header',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedCircleGroup(
                      primaryColor: Color(0xff4563AF),
                      pointColor: Color(0xffffffff),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        kAppName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: GoogleFonts.lobster().fontFamily,
                        ),
                      ),
                    ),
                    RoundedCircleGroup(
                      primaryColor: Color(0xffAF455F),
                      pointColor: Color(0xffffffff),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 150.0,
                      child: Hero(
                        tag: 'center-circles',
                        child: StackedCircle(
                          pointColor: Color(0xff4563AF),
                        ),
                      ),
                    ),
                    Positioned(
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.bounceInOut,
                        padding: EdgeInsets.only(bottom: bottomPadding),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: 'auth-footer',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedCircleGroup(
                      primaryColor: Color(0xffAF455F),
                      pointColor: Color(0xffffffff),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            SizedBox(height: 8.0),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'Made with ❤ by Kencode',
                                style: kAuthFooterTextStyle,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'Copyright @ 2021',
                                style: kAuthFooterTextStyle,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RoundedCircleGroup(
                      primaryColor: Color(0xff4563AF),
                      pointColor: Color(0xffffffff),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
