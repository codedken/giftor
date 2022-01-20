import 'package:giftor/models/my_shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../my_packages/my_packages.dart';
import '../constants_and_methods.dart';
import '../widgets/deletion_confirm_dialog.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  Future<void> _showAlertBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
          title: Text('Select theme'),
          content: RadioListTile(
            value: 1,
            groupValue: 1,
            onChanged: (value) {},
            title: Text('Dark mode'),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = MySharedPreferences.userData;
    final person = MySharedPreferences.getUser(userData);
    return Scaffold(
      backgroundColor: kScaffoldColor.withOpacity(0.7),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kScaffoldColor,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: CachedNetworkImage(
              imageUrl: person.imageUrl!,
              imageBuilder: (ctx, imageProvider) => CircleAvatar(
                radius: 30.0,
                backgroundColor: const Color(0xffffffff),
                child: CircleAvatar(
                  radius: 28.0,
                  backgroundImage: imageProvider,
                ),
              ),
              placeholder: (ctx, url) => CircleAvatar(
                radius: 30.0,
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
            title: Text(
              person.name!,
              style: TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              person.email!,
              style: TextStyle(
                color: const Color(0xffffffff).withOpacity(0.7),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: const Color(0xffffffff)),
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
          Divider(color: const Color(0xffffffff)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.apps,
                      color: const Color(0xffffffff),
                    ),
                    title: Text(
                      'Theme',
                      style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Dark mode',
                      style: TextStyle(
                        color: const Color(0xffffffff).withOpacity(0.7),
                      ),
                    ),
                    onTap: () => _showAlertBox(context),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Delete my account',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (cxt) => DelConfirmDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Text(
            kAppName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: GoogleFonts.lobster().fontFamily,
            ),
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
