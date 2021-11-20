import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants_and_methods.dart';

class SelectedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSelectedCardWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [
            const Color(0xff1F2431),
            const Color(0xff233D81).withOpacity(0.35),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'You are giving a gift to this cool fellow',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Color(0xffB0B5C1),
                  radius: 50.0,
                  child: CircleAvatar(
                    radius: 46.0,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.userAlt,
                              color: const Color(0xffffffff).withOpacity(0.76),
                              size: 18.0,
                            ),
                            const SizedBox(width: 8.0),
                            const Text(
                              'Charles Callistus',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.phone,
                              color: Color(0xffffffff).withOpacity(0.76),
                              size: 18.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '+2348054848498',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffffffff).withOpacity(0.13),
                              side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(),
                            ),
                            child: Text(
                              'Deliver gift',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
