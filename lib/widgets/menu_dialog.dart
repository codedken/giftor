import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';

import '../models/person/person.dart';
import '../my_packages/my_packages.dart';
import '../providers/auth_provider.dart';
import '../constants_and_methods.dart';
import '../screens/screens.dart';

class MenuDialog extends StatelessWidget {
  final BuildContext ctx;
  final Person person;

  MenuDialog({required this.ctx, required this.person});

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
            await Provider.of<AuthProvider>(
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
    return AlertDialog(
      contentPadding: const EdgeInsets.only(
        top: 16.0,
        bottom: 20.0,
      ),
      elevation: 16.0,
      backgroundColor: const Color(0xff170F2F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            kAppName,
            style: TextStyle(
              color: const Color(0xffffffff),
              fontSize: 32,
              fontFamily: GoogleFonts.lobster().fontFamily,
            ),
          ),
          ListTile(
            title: Text(
              person.name!,
              style: TextStyle(
                color: const Color(0xffffffff),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Text(
              person.email!,
              style: TextStyle(
                color: const Color(0xffffffff),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            leading: CachedNetworkImage(
              imageUrl: person.imageUrl!,
              imageBuilder: (ctx, imageProvider) => CircleAvatar(
                radius: 24.0,
                backgroundColor: const Color(0xffffffff),
                child: CircleAvatar(
                  radius: 22.0,
                  backgroundImage: imageProvider,
                ),
              ),
              placeholder: (ctx, url) => CircleAvatar(
                radius: 24.0,
                backgroundColor: const Color(0xffffffff),
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.transparent,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 2.0,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 24.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Divider(
            color: const Color(0xffffffff),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: const Color(0xffffffff),
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: const Color(0xffffffff)),
            ),
            onTap: () => Navigator.pushReplacementNamed(
              context,
              SettingsScreen.routeName,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.power_settings_new,
              color: const Color(0xffffffff),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: const Color(0xffffffff),
              ),
            ),
            onTap: _logout,
          ),
          Divider(
            color: const Color(0xffffffff),
          ),
          SizedBox(height: 8.0),
          Center(
            child: Link(
              target: LinkTarget.self,
              uri: Uri.parse(
                'https://github.com/codedken/private-policy-for-giftor/blob/main/README.md',
              ),
              builder: (context, followLink) => BouncingWidget(
                onPressed: () {
                  Navigator.of(context).pop();
                  followLink!();
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: const Color(0xffffffff),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
