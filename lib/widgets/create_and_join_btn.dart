import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './home_button.dart';

class CreateAndJoinBtn extends StatelessWidget {
  final VoidCallback createGroup;
  final VoidCallback joinGroup;

  CreateAndJoinBtn({
    required this.createGroup,
    required this.joinGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'home-buttons',
      child: Material(
        color: Colors.transparent,
        child: Row(

          children: <Widget>[
            HomeButton(
              btnColor: Color(0xff1323B4).withOpacity(0.9),
              btnText: 'Create group',
              onTap: createGroup,
              btnIcon: FaIcon(
                FontAwesomeIcons.pen,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            SizedBox(width: 8.0),
            HomeButton(
              btnColor: Color(0xffBE123C),
              btnText: 'Join group',
              onTap: joinGroup,
              btnIcon: FaIcon(
                FontAwesomeIcons.users,
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
