import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String kAppName = 'Giftor';

TextStyle kAuthInputHintStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'Kodchasan',
  color: Color(0xff000000).withOpacity(0.3),
);

TextStyle kAuthInputTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Roboto',
  color: Color(0xff000000).withOpacity(0.7),
);
TextStyle kAuthErrorStyle = TextStyle(
  color: Colors.white,
);

AlertStyle kAlertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isOverlayTapDismiss: false,
  isCloseButton: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.start,
  animationDuration: const Duration(seconds: 1),
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

const kAuthInputPadding = const EdgeInsets.symmetric(
  vertical: 16.0,
  horizontal: 8.0,
);

TextStyle kAuthFooterTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

double getAuthContainerWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.80;
}

double getHomeButtonWidth(BuildContext context) {
  return getHomeContainerWidth(context) * 0.48;
}

double getSelectedCardWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.90;
}

double getHomeContainerWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.9;
}

PageTransition pageTransitionWidget(Widget widget) {
  return PageTransition(
    child: widget,
    type: PageTransitionType.rightToLeftWithFade,
    duration: const Duration(milliseconds: 800),
    reverseDuration: const Duration(milliseconds: 800),
    curve: Curves.easeInOut,
  );
}

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

const kSpaceBox = SizedBox(height: 4.0);
