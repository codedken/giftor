import 'package:google_fonts/google_fonts.dart';

import '../my_packages/my_packages.dart';

import '../widgets/widgets.dart';

import './screens.dart';

import '../constants_and_methods.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Row(
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
              Expanded(
                child: Column(
                  children: [
                    StackedCircle(
                      pointColor: Color(0xffAF455F),
                    ),
                    SizedBox(height: 60.0),
                    Text(
                      kAppName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: GoogleFonts.lobster().fontFamily,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Spread love by exchanging gifts with one another',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    StackedCircle(
                      pointColor: Color(0xff4563AF),
                    ),
                    Spacer(),
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
                    SizedBox(height: 12.0),
                  ],
                ),
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
