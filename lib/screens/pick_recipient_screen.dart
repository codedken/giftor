import 'dart:async';
import 'dart:math';

import '../models/person/person.dart';
import '../models/my_shared_preferences.dart';

import '../my_packages/my_packages.dart';

import '../widgets/widgets.dart';
import '../providers/group_provider.dart';
import '../providers/auth_provider.dart';

class PickRecipientScreen extends StatefulWidget {
  static const String routeName = '/pick_recipient_screen';

  final String groupId;

  PickRecipientScreen(this.groupId);

  @override
  State<PickRecipientScreen> createState() => _PickRecipientScreenState();
}

class _PickRecipientScreenState extends State<PickRecipientScreen> {
  var users = [];
  var sub;
  var selectedId = null;
  int selectedIndex = 0;
  bool onPressed = false;
  bool _isLoading = true;
  String? _groupName = '';
  String? userId = null;
  var person;
  final _userData = MySharedPreferences.userData;
  var selectedPerson = null;

  @override
  void initState() {
    if (MySharedPreferences.exists(_userData)) {
      person = MySharedPreferences.getUser(_userData);
      if (person is PersonSaveLocally) {
        userId = person.id;
      }
    }
    sub = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen((doc) async {
      final isGroupExist = await Provider.of<GroupProvider>(
        context,
        listen: false,
      ).isGroupExists(widget.groupId);

      if (isGroupExist == false) {
        Navigator.of(context).pop();
      }
    });
    setSelectedId();
    if (selectedId == null) {
      getUnSelectedUsers();
    }
    getGroupProvider.getGroup(widget.groupId).then((value) => setState(() {
          _groupName = value.title;
          _isLoading = false;
        }));
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  GroupProvider get getGroupProvider {
    return Provider.of<GroupProvider>(
      context,
      listen: false,
    );
  }

  void getUnSelectedUsers() async {
    users = await getGroupProvider.getUnSelectedMembers(widget.groupId);
  }

  void setSelectedId() async {
    final groupProvider = Provider.of<GroupProvider>(
      context,
      listen: false,
    );
    final result = await groupProvider.getSelectedId(widget.groupId);
    setState(() {
      selectedId = result;
      if (selectedId != null) {
        findSelectedUserById(selectedId);
      }
    });
  }

  void findSelectedUserById(String id) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final result = await authProvider.findById(id);
    setState(() => selectedPerson = result);
  }

  void shuffleUsers() async {
    final groupProvider = Provider.of<GroupProvider>(
      context,
      listen: false,
    );
    if (users.length > 0) {
      setState(() => onPressed = true);
      final ran = Random();
      for (int i = 0; i < 40; i++) {
        setState(() => selectedIndex = ran.nextInt(users.length));
        await Future.delayed(const Duration(milliseconds: 20));
      }
      await groupProvider.updateAfterSelection(
        selectedId: users[selectedIndex].id,
        groupId: widget.groupId,
      );
      setState(() {
        selectedId = users[selectedIndex].id;
        findSelectedUserById(selectedId);
        onPressed = false;
      });
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No more persons to select from',
            style: TextStyle(
              color: const Color(0xFF222020),
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color(0xffc8c8c8),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 32.0),
          shape: StadiumBorder(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userData = MySharedPreferences.userData;
    final person = MySharedPreferences.getUser(_userData);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff0A0616),
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Header(ctx: context, person: person),
              SizedBox(height: 24.0),
              Expanded(
                child: Container(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: const Color(0xffffffff),
                            strokeWidth: 2.0,
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              _groupName!,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Expanded(
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: Text(
                                          'Randomly select who you want to gift an item to',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Container(
                                        width: 120.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.white,
                                        ),
                                        child: onPressed
                                            ? Center(
                                                child: Text(
                                                  '$selectedIndex',
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              )
                                            : Image.asset(
                                                'assets/images/placeholderimage.png',
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xff1F1BF1)
                                              .withOpacity(0.74),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        child: Text(
                                          selectedId != null
                                              ? 'Picked!'
                                              : 'Pick recipient',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            color: selectedId != null
                                                ? Colors.white54
                                                : Colors.white,
                                          ),
                                        ),
                                        onPressed: selectedId != null
                                            ? null
                                            : shuffleUsers,
                                      ),
                                      SizedBox(height: 4.0),
                                      FewerStackedCircle(
                                        pointColor:
                                            Color(0xffffffff).withOpacity(0.8),
                                      ),
                                      SizedBox(height: 44.0),
                                      if (selectedId != null &&
                                          selectedPerson != null)
                                        SelectedCard(selectedPerson),
                                      SizedBox(height: 8.0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
