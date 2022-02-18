import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String kAppName = 'Giftor';

TextStyle kAuthInputHintStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: GoogleFonts.kodchasan().fontFamily,
  color: kTextColorWithOpacity,
);

Color kScaffoldColor = const Color(0xff0A0616);

Color kTextColorWithOpacity = const Color(0xff000000).withOpacity(0.2);

//full screen
void get kShowBottomStatusBar async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: const Color(0xff0A0616),
    ),
  );
}

//style for authentication input
TextStyle kAuthInputTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontFamily: GoogleFonts.roboto().fontFamily,
  color: Color(0xff000000).withOpacity(0.6),
);
TextStyle kAuthErrorStyle = TextStyle(
  color: Colors.white,
);

//style for pop up dialog box
AlertStyle kAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isOverlayTapDismiss: false,
  isCloseButton: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.start,
  animationDuration: const Duration(milliseconds: 800),
  alertPadding: const EdgeInsets.all(16.0),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide.none,
  ),
  titleStyle: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
);

//padding for authentication input
const kAuthInputPadding = const EdgeInsets.symmetric(
  vertical: 16.0,
  horizontal: 8.0,
);

//style for footer text
TextStyle kAuthFooterTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);

//width for authentication container
double getAuthContainerWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.80;
}

//width for the buttons home screen
double getHomeButtonWidth(BuildContext context) {
  return getHomeContainerWidth(context) * 0.48;
}

//width for the card of a selected participant
double getSelectedCardWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.90;
}

//width for the container in home screen
double getHomeContainerWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.9;
}

//screen transition function
PageTransition pageTransitionWidget(Widget widget) {
  return PageTransition(
    child: widget,
    type: PageTransitionType.rightToLeftWithFade,
    duration: const Duration(milliseconds: 700),
    reverseDuration: const Duration(milliseconds: 700),
    curve: Curves.fastOutSlowIn,
  );
}

//style/function for custom dialog box
DialogButton myDialogButton({
  required BuildContext ctx,
  required String btnText,
  required Color btnColor,
  required VoidCallback onTap,
}) {
  return DialogButton(
    margin: const EdgeInsets.all(0),
    padding: const EdgeInsets.all(0),
    child: Text(
      btnText,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    ),
    onPressed: onTap,
    color: btnColor,
  );
}

//display dialog box function
void showAlertBox({
  required BuildContext context,
  required AlertType dialogType,
  required String title,
  required String? body,
}) async {
  await Alert(
    context: context,
    title: title,
    content: Text(body!),
    type: dialogType,
    style: kAlertStyle,
    buttons: [
      DialogButton(
        child: Text(
          'Okay',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
        color: Color(0xff1323B4).withOpacity(0.80),
      ),
    ],
  ).show();
}

//default sizedBox
const kSpaceBox = SizedBox(height: 4.0);
