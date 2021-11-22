import '../my_packages/my_packages.dart';
import '../constants_and_methods.dart';
import '../screens/screens.dart';
import '../models/person/person.dart';

import '../providers/auth_provider.dart';

class Header extends StatelessWidget {
  final BuildContext ctx;
  final Person person;
  Header({required this.ctx, required this.person});

  void _logout() async {
    await Provider.of<AuthProvider>(
      ctx,
      listen: false,
    ).notify();
    await Alert(
      context: ctx,
      type: AlertType.none,
      style: kAlertStyle,
      content: Text(
        'Do you want to sign out?',
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      buttons: [
        myDialogButton(
          ctx: ctx,
          btnText: 'Yes',
          btnColor: Color(0xff1323B4).withOpacity(0.9),
          onTap: () async {
            Provider.of<AuthProvider>(
              ctx,
              listen: false,
            ).logout();
            Navigator.pushNamedAndRemoveUntil(
              ctx,
              LoginScreen.routeName,
              (Route route) => false,
            );
          },
        ),
        myDialogButton(
          ctx: ctx,
          btnText: 'Cancel',
          btnColor: Color(0xffBE123C),
          onTap: () => Navigator.of(ctx).pop(),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'header',
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: person.imageUrl!,
              imageBuilder: (ctx, imageProvider) => CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 26.0,
                  backgroundImage: imageProvider,
                ),
              ),
              placeholder: (ctx, url) => CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.transparent,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Text(
              kAppName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Lobster',
              ),
            ),
            PopupMenuButton(
              offset: Offset(-24, 36),
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              iconSize: 36.0,
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.power_settings_new_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  onTap: _logout,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
