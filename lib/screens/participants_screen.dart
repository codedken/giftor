import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';

import '../models/my_shared_preferences.dart';

import '../screens/screens.dart';

import '../constants_and_methods.dart';

class ParticipantsScreen extends StatelessWidget {
  static const String routeName = '/participants_screen';
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
                color: Color(0xff0A0616).withOpacity(0.4),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(ctx: context, person: person),
                    SizedBox(height: 32.0),
                    Hero(
                      tag: 'home-buttons',
                      child: Material(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            HomeButton(
                              btnColor: Color(0xff1323B4).withOpacity(0.9),
                              btnText: 'Pick giftee',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PickRecipientScreen.routeName,
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
                              btnColor: Color(0xffBE123C),
                              btnText: 'delete group',
                              onTap: () {},
                              btnIcon: FaIcon(
                                FontAwesomeIcons.times,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Hero(
                      tag: 'search-input',
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xff000000).withOpacity(0.3),
                              size: 28.0,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search participant',
                            hintStyle: kAuthInputHintStyle.copyWith(
                              fontSize: 16.0,
                            ),
                            contentPadding: kAuthInputPadding,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Participants',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Spacer(),
                          Text(
                            'A34C65',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 4.0),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'share code',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ParticipantCard(
                                participantName: 'Chibuzor Charles',
                                recipientName: 'Chinasa Chisom',
                                participantImageUrl:
                                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                recipientImageUrl:
                                    'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                giftStatus: 'delivered',
                                arrowColor: Colors.green,
                              ),
                              ParticipantCard(
                                participantName: 'Joy Emordi',
                                recipientName: 'Ugochukwu Tony',
                                participantImageUrl:
                                    'https://media.istockphoto.com/photos/learn-to-love-yourself-first-picture-id1291208214?b=1&k=20&m=1291208214&s=170667a&w=0&h=sAq9SonSuefj3d4WKy4KzJvUiLERXge9VgZO-oqKUOo=',
                                recipientImageUrl:
                                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                giftStatus: 'Pending delivery',
                                arrowColor: Color(0xffE8C510),
                              ),
                              ParticipantCard(
                                participantName: 'Emmanuel Ajah',
                                recipientName: null,
                                participantImageUrl:
                                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                recipientImageUrl: null,
                                giftStatus: 'No recipient',
                              ),
                              ParticipantCard(
                                participantName: 'Chinasa Chisom',
                                recipientName: 'Emmanuel Ajah',
                                participantImageUrl:
                                    'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                recipientImageUrl:
                                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHBlcnNvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                giftStatus: 'Pending delivery',
                                arrowColor: Colors.green,
                              ),
                              ParticipantCard(
                                participantName: 'Ugochukwu Tony',
                                recipientName: 'Chibuzor Charles',
                                participantImageUrl:
                                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                recipientImageUrl:
                                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                                giftStatus: 'Pending delivery',
                                arrowColor: Colors.green,
                              ),
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
