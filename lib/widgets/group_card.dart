import 'package:bouncing_widget/bouncing_widget.dart';

import '../my_packages/my_packages.dart';

class GroupCard extends StatefulWidget {
  final String groupName;
  final String createdByText;
  final String statusText;
  final VoidCallback onTap;

  GroupCard({
    required this.groupName,
    required this.createdByText,
    required this.statusText,
    required this.onTap,
  });

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: widget.onTap,
      scaleFactor: 1.0,
      child: Card(
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
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.groupName,
                      style: TextStyle(
                        color: Color(0xff000000).withOpacity(0.75),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Creator: ${widget.createdByText}',
                      style: TextStyle(
                        color: Color(0xFF000000).withOpacity(0.58),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Status: ${widget.statusText}',
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
