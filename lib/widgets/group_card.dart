import 'package:giftor/models/group/group.dart';
import 'package:giftor/providers/auth_provider.dart';

import '../my_packages/my_packages.dart';
import '../screens/participants_screen.dart';
import '../screens/pick_recipient_screen.dart';

class GroupCard extends StatelessWidget {
  final Group group;

  GroupCard({
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    return Card(
      key: ValueKey<Group>(group),
      color: Colors.white,
      elevation: 12.0,
      margin: const EdgeInsets.only(bottom: 8.0),
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          authProvider.isMe(group.creatorId)
              ? Navigator.pushNamed(
                  context,
                  ParticipantsScreen.routeName,
                  arguments: group,
                )
              : Navigator.pushNamed(
                  context,
                  PickRecipientScreen.routeName,
                  arguments: group.id,
                );
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      group.title!,
                      style: TextStyle(
                        color: Color(0xff000000).withOpacity(0.75),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Creator: ${authProvider.isMe(
                        group.creatorId,
                      ) ? 'Me' : group.creatorName}',
                      style: TextStyle(
                        color: Color(0xFF000000).withOpacity(0.58),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Status: ${authProvider.isMe(
                        group.creatorId,
                      ) ? 'Owner' : 'Member'}',
                      style: TextStyle(
                        color: Color(0xff000000).withOpacity(0.58),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xff000000).withOpacity(0.16),
                radius: 25,
                child: CircleAvatar(
                  backgroundColor: Color(0xffF3F5F9),
                  radius: 22,
                  child: FaIcon(
                    FontAwesomeIcons.users,
                    color: Color(0xff000000).withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
