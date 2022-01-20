import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/participant.dart';

class ParticipantCard extends StatelessWidget {
  final Participant participant;
  ParticipantCard(this.participant);
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
                    participant.name!,
                    style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.75),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'to: ${participant.pickedUserName ?? 'Not picked'}',
                    style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.58),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Gift Status: ${participant.giftStatus!}',
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
                mainAxisAlignment: participant.pickedUserName == null
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    margin: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(44.0),
                    ),
                    elevation: 12.0,
                    child: CachedNetworkImage(
                      imageUrl: participant.imgUrl!,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: participant.pickedUserName == null ? 22 : 18,
                        backgroundColor: Colors.white,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => CircleAvatar(
                        radius: participant.pickedUserName == null ? 22 : 18,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      errorWidget: (ctx, url, error) => CircleAvatar(
                        radius: participant.pickedUserName == null ? 22 : 18,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  if (participant.pickedUserName != null) SizedBox(width: 4.0),
                  if (participant.pickedUserName != null)
                    FaIcon(
                      FontAwesomeIcons.longArrowAltRight,
                      color: const Color(0xff1DD72F),
                    ),
                  if (participant.pickedUserName != null) SizedBox(width: 4.0),
                  if (participant.pickedUserName != null)
                    Card(
                      margin: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44.0),
                      ),
                      elevation: 12.0,
                      child: CachedNetworkImage(
                        imageUrl: participant.pickedUserImgUrl!,
                        placeholder: (ctx, url) => CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          backgroundImage: imageProvider,
                        ),
                        errorWidget: (ctx, url, error) => CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
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
