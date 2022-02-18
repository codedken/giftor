import 'package:clipboard/clipboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../constants_and_methods.dart';
import '../my_packages/my_packages.dart';

import '../providers/group_provider.dart';

import '../widgets/widgets.dart';

import '../models/my_shared_preferences.dart';
import '../models/group/group.dart';

class ParticipantsScreen extends StatefulWidget {
  static const String routeName = '/participants_screen';

  final Group group;
  ParticipantsScreen({required this.group});

  @override
  State<ParticipantsScreen> createState() => _ParticipantsScreenState();
}

class _ParticipantsScreenState extends State<ParticipantsScreen> {
  bool _isLoading = false;
  bool _participantsLoading = true;
  bool _isButtonDisabled = false;
  @override
  void initState() {
    final groupProvider = Provider.of<GroupProvider>(context, listen: false);
    groupProvider.fetchAllGroupMember(widget.group.id).then(
          (value) => groupProvider.setSelectionStarted(widget.group.id!).then(
                (value) => setState(() {
                  _participantsLoading = false;
                  if (groupProvider.selectionStarted) {
                    _isButtonDisabled = true;
                  }
                }),
              ),
        );
    super.initState();
  }

  void _deleteGroup() async {
    Navigator.pop(context);
    setState(() => _isLoading = true);
    await Provider.of<GroupProvider>(
      context,
      listen: false,
    ).deleteGroup(widget.group);
    Navigator.pop(context);
  }

  void _filterParticipants(String value) async {
    await Provider.of<GroupProvider>(
      context,
      listen: false,
    ).filterParticipants(value);
  }

  void _showAlertBox({
    required BuildContext context,
    required AlertType dialogType,
    required String? title,
    required String body,
  }) async {
    await Alert(
      context: context,
      title: title,
      content: Text(
        body,
        textAlign: TextAlign.center,
      ),
      type: dialogType,
      style: kAlertStyle,
      buttons: [
        DialogButton(
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          onPressed: () async {
            await Provider.of<GroupProvider>(
              context,
              listen: false,
            ).allowSelection(widget.group.id!);
            Navigator.of(context).pop();
            setState(() => _isButtonDisabled = true);
          },
          color: const Color(0xffBE123C),
        ),
        DialogButton(
          child: Text(
            'No',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          color: Color(0xff1323B4).withOpacity(0.80),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final _userData = MySharedPreferences.userData;
    final person = MySharedPreferences.getUser(_userData);
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff0A0616),
        appBar: null,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(ctx: context, person: person),
                SizedBox(height: 32.0),
                PickAndDeleteBtn(
                  groupId: widget.group.id!,
                  deleteFn: _deleteGroup,
                ),
                SizedBox(height: 15.0),
                SearchInput(
                  function: _filterParticipants,
                  placeholder: 'Search participants',
                ),
                SizedBox(height: 14.0),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'list-title',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            'Members',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        widget.group.id!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: 12.0),
                      BouncingWidget(
                        onPressed: () async {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          await FlutterClipboard.copy(widget.group.id!);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              '✔️ Copied to Clipboard',
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
                        child: Icon(
                          Icons.content_copy,
                          color: const Color(
                            0xffffffff,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      BouncingWidget(
                        onPressed: () {
                          Share.share(
                            '${widget.group.id!}\n\nUse the above code to join ${widget.group.title!} group on Giftor.\n\nCopy and paste the code to avoid entering the wrong code.\n\nClick the link below to download the Giftor app\nhttps://play.google.com/store/apps/details?id=com.chekslate.giftor',
                          );
                        },
                        child: Icon(
                          Icons.share,
                          color: const Color(
                            0xffffffff,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.0),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        child: Consumer<GroupProvider>(
                          builder: (ctx, group, _) {
                            if (_participantsLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: const Color(0xffffffff),
                                  strokeWidth: 2.0,
                                ),
                              );
                            }
                            if (group.filteredParticipants.isEmpty) {
                              return Text(
                                '😎 Ooops.. No results found',
                                style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontSize: 16,
                                  fontFamily:
                                      GoogleFonts.kodchasan().fontFamily,
                                ),
                              );
                            }
                            final data = group.filteredParticipants;
                            return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (ctx, i) {
                                return ParticipantCard(data[i]);
                              },
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 24.0,
                        right: 0,
                        child: Consumer<GroupProvider>(
                          builder: (ctx, groupProvider, _) => ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 8.0,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                const Color(0xffffffff),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return groupProvider.allowSelectionColor
                                      .withOpacity(0.3);
                                }
                                return groupProvider.allowSelectionColor;
                              }),
                            ),
                            child: Text(groupProvider.allowSelectionText),
                            onPressed: _participantsLoading
                                ? null
                                : _isButtonDisabled
                                    ? null
                                    : () => _showAlertBox(
                                          context: context,
                                          dialogType: AlertType.none,
                                          title: 'Allow selection',
                                          body:
                                              'You are about to allow participants to start picking who to gift an item to',
                                        ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                FooterCircles(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
