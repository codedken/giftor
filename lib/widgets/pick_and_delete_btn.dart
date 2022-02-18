import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants_and_methods.dart';
import './home_button.dart';
import '../screens/pick_recipient_screen.dart';

class PickAndDeleteBtn extends StatelessWidget {
  final String groupId;
  final VoidCallback deleteFn;
  PickAndDeleteBtn({
    required this.groupId,
    required this.deleteFn,
  });
  void _showAlertBox({
    required BuildContext context,
    required AlertType dialogType,
    required String? title,
    required String body,
  }) async {
    await Alert(
      context: context,
      title: title,
      content: Text(
        body,
        textAlign: TextAlign.center,
      ),
      type: dialogType,
      style: kAlertStyle,
      buttons: [
        DialogButton(
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          onPressed: deleteFn,
          color: const Color(0xffBE123C),
        ),
        DialogButton(
          child: Text(
            'No',
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

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'home-buttons',
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            HomeButton(
              btnColor: const Color(0xff1323B4).withOpacity(0.9),
              btnText: 'Pick giftee',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PickRecipientScreen.routeName,
                  arguments: groupId,
                );
              },
              btnIcon: FaIcon(
                FontAwesomeIcons.userPlus,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            SizedBox(width: 8.0),
            HomeButton(
              btnColor: const Color(0xffBE123C),
              btnText: 'delete group',
              onTap: () => _showAlertBox(
                context: context,
                body: 'want to delete this group',
                dialogType: AlertType.none,
                title: 'Confirm Delete',
              ),
              btnIcon: FaIcon(
                FontAwesomeIcons.times,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
