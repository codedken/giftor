import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import '../my_packages/my_packages.dart';
import '../providers/group_provider.dart';
import '../models/my_shared_preferences.dart';
import '../models/person/person.dart';
import '../widgets/widgets.dart';
import './screens.dart';
import '../constants_and_methods.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  static StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? sub;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var person;
  final _userData = MySharedPreferences.userData;
  String? userId = null;
  List myGroups = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  @override
  void initState() {
    setState(() => _isLoading = true);
    if (MySharedPreferences.exists(_userData)) {
      person = MySharedPreferences.getUser(_userData);
      if (person is PersonSaveLocally) {
        userId = person.id;
      }
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }

    HomeScreen.sub = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen((doc) {
      Provider.of<GroupProvider>(
        context,
        listen: false,
      ).fetchAllUserGroups(userId).then(
            (value) => setState(() => _isLoading = false),
          );
    });
    super.initState();
  }

  @override
  void dispose() {
    HomeScreen.sub!.cancel();
    super.dispose();
  }

  void _createGroupDialog() async {
    await _showBottomSheet(CreateGroupForm());
  }

  void _joinGroupDialog() async {
    await _showBottomSheet(JoinGroupForm());
  }

  Future<void> _showBottomSheet(Widget child) async {
    showMaterialModalBottomSheet(
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
          child: child,
        ),
      ),
    );
  }

  void _filterGroup(String enteredText) async {
    await Provider.of<GroupProvider>(
      context,
      listen: false,
    ).filterGroup(enteredText, userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: kScaffoldColor,
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(ctx: context, person: person),
              SizedBox(height: 32.0),
              CreateAndJoinBtn(
                createGroup: _createGroupDialog,
                joinGroup: _joinGroupDialog,
              ),
              SizedBox(height: 15.0),
              SearchInput(
                function: _filterGroup,
                placeholder: 'Search group',
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Hero(
                  tag: 'list-title',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Groups',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: const Color(0xffffffff),
                          strokeWidth: 2.0,
                        ),
                      )
                    : Consumer<GroupProvider>(
                        builder: (ctx, group, _) {
                          return group.allGroupsList.isEmpty
                              ? Center(
                                  child: Text(
                                    'No group yet? Create or Join one',
                                    style: TextStyle(
                                      color: const Color(0xffffffff),
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                    ),
                                  ),
                                )
                              : group.filteredList.isEmpty
                                  ? Container(
                                      width: double.infinity,
                                      child: Text(
                                        '😎 Ooops.. Enter a valid group name',
                                        style: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 16,
                                          fontFamily: GoogleFonts.kodchasan()
                                              .fontFamily,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: group.filteredList.length,
                                      itemBuilder: (ctx, i) {
                                        final revGroupList = group.filteredList;
                                        return GroupCard(
                                          group: revGroupList[i],
                                        );
                                      },
                                    );
                        },
                      ),
              ),
              SizedBox(height: 8.0),
              FooterCircles(),
            ],
          ),
        ),
      ),
    );
  }
}
