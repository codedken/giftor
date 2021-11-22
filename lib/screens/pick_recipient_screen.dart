import 'package:flutter/material.dart';
import 'package:giftor/widgets/widgets.dart';
import '../models/my_shared_preferences.dart';

import '../widgets/rounded_circle_group.dart';
import '../widgets/fewer_stacked_circle.dart';
import '../widgets/selected_card.dart';

class PickRecipientScreen extends StatelessWidget {
  static const String routeName = '/pick_recipient_screen';
  @override
  Widget build(BuildContext context) {
    final _userData = MySharedPreferences.userData;
    final person = MySharedPreferences.getUser(_userData);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff0A0616),
      appBar: null,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0A0616),
              ),
              child: Image.asset(
                'assets/images/gifts.png',
                width: 826,
                height: 944,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                color: Color(0xff0A0616).withOpacity(0.1),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              top: 0.0,
              bottom: 110.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: [
                    Header(ctx: context, person: person),
                    SizedBox(height: 24.0),
                    Text(
                      'Kings Model Youths',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  'Randomly select who you want to gift an item to',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  'assets/images/placeholderimage.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff1F1BF1).withOpacity(0.74),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text(
                                  'Pick recipient',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(height: 4.0),
                              FewerStackedCircle(
                                pointColor: Color(0xffffffff).withOpacity(0.8),
                              ),
                              SizedBox(height: 44.0),
                              SelectedCard(),
                              SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 110.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff010A29),
                      Color(0xff4F0A1B),
                    ],
                  ),
                ),
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
          ],
        ),
      ),
    );
  }
}
