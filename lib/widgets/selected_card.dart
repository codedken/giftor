import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/person/person.dart';
import '../constants_and_methods.dart';

class SelectedCard extends StatelessWidget {
  final Person person;
  SelectedCard(this.person);
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
                CachedNetworkImage(
                  imageUrl: person.imageUrl!,
                  imageBuilder: (ctx, imageProvider) => CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46.0,
                      backgroundImage: imageProvider,
                    ),
                  ),
                  placeholder: (ctx, image) => CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.transparent,
                      child: CircularProgressIndicator(
                        color: const Color(0xffB0B5C1),
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                      size: 48.0,
                    ),
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
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                '${person.name!}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
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
                              person.phoneNo!,
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
                            onPressed: () {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  '🤞 Coming soon!!!',
                                  style: TextStyle(
                                    color: const Color(
                                      0xff000000,
                                    ),
                                  ),
                                ),
                                backgroundColor: const Color(0xffffffff),
                                padding: EdgeInsets.all(24.0),
                              ));
                            },
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
