import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantCard extends StatelessWidget {
  final String participantName;
  final String participantImageUrl;
  final String? recipientName;
  final String? recipientImageUrl;
  final String giftStatus;
  final Color? arrowColor;

  ParticipantCard({
    required this.participantName,
    required this.participantImageUrl,
    this.recipientName,
    this.recipientImageUrl,
    required this.giftStatus,
    this.arrowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 12.0,
      margin: const EdgeInsets.only(bottom: 8.0),
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    participantName,
                    style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.75),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    recipientName == null
                        ? 'to: Not selected'
                        : 'to: $recipientName',
                    style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.58),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Status: $giftStatus',
                    style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.58),
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: recipientName == null
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    margin: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(44.0),
                    ),
                    elevation: 12.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(participantImageUrl),
                      radius: recipientName == null ? 22 : 18,
                    ),
                  ),
                  if (recipientName != null)
                  SizedBox(width: 4.0),
                  if (recipientName != null)
                    FaIcon(
                      FontAwesomeIcons.longArrowAltRight,
                      color: arrowColor,
                    ),
                  if (recipientName != null)
                  SizedBox(width: 4.0),
                  if (recipientName != null)
                    Card(
                      margin: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44.0),
                      ),
                      elevation: 12.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(recipientImageUrl!),
                        radius: 22,
                      ),
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
