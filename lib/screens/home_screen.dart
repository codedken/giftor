import 'package:giftor/screens/login_screen.dart';

import '../my_packages/my_packages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../providers/auth_provider.dart';
import '../providers/group_provider.dart';

import '../models/my_shared_preferences.dart';
import '../models/person/person.dart';

import '../widgets/widgets.dart';

import './screens.dart';

import '../constants_and_methods.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var person;
  final _userData = MySharedPreferences.userData;
  String? userId = null;
  List myGroups = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (MySharedPreferences.exists(_userData)) {
      person = MySharedPreferences.getUser(_userData);
      if (person is PersonSaveLocally) {
        userId = person.id;
      }
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }

    Provider.of<GroupProvider>(
      context,
      listen: false,
    ).fetchAllUserGroups(userId!).then((value) => setState(() {}));

    super.initState();
  }

  void _createGroupDialog() async {
    await showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => AnimatedPadding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.0,
          left: 20.0,
          right: 20.0,
        ),
        duration: const Duration(milliseconds: 600),
        child: Container(
          child: CreateGroupForm(),
        ),
      ),
    );
  }

  void _joinGroupDialog() async {
    await showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => AnimatedPadding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.0,
          left: 20.0,
          right: 20.0,
        ),
        duration: const Duration(milliseconds: 600),
        child: Container(
          child: JoinGroupForm(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      key: _scaffoldKey,
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
                              btnText: 'Create group',
                              onTap: _createGroupDialog,
                              btnIcon: FaIcon(
                                FontAwesomeIcons.pen,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            HomeButton(
                              btnColor: Color(0xffBE123C),
                              btnText: 'Join group',
                              onTap: _joinGroupDialog,
                              btnIcon: FaIcon(
                                FontAwesomeIcons.users,
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
                            hintText: 'Search group',
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
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'LIST OF GROUPS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Expanded(
                      child: Consumer<GroupProvider>(
                        builder: (ctx, group, _) => Container(
                          alignment: group.allGroupsList.isEmpty
                              ? Alignment.center
                              : Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: group.allGroupsList.isEmpty
                                ? Text(
                                    'No group yet. Create or join one',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                : Column(
                                    children: group.allGroupsList.map(
                                      (value) {
                                        return GroupCard(
                                          groupName: value.title!,
                                          createdByText:
                                              authProvider.isMe(value.creatorId)
                                                  ? 'Me'
                                                  : value.creatorName!,
                                          statusText:
                                              authProvider.isMe(value.creatorId)
                                                  ? 'Owner'
                                                  : 'Member',
                                          onTap: () {
                                            authProvider.isMe(value.creatorId)
                                                ? Navigator.pushNamed(
                                                    context,
                                                    ParticipantsScreen
                                                        .routeName,
                                                  )
                                                : Navigator.pushNamed(
                                                    context,
                                                    PickRecipientScreen
                                                        .routeName,
                                                  );
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ),
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
