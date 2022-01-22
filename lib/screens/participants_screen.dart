import 'package:clipboard/clipboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

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
  @override
  void initState() {
    Provider.of<GroupProvider>(
      context,
      listen: false,
    ).fetchAllGroupMember(widget.group.id).then(
          (value) => setState(
            () => _participantsLoading = false,
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
                            '${widget.group.id!}\n\nUse the above code to join ${widget.group.title!} group on Giftor.\n\nCopy and paste the code to avoid entering the wrong code.\n\nClick the link below to download the Giftor app\nwww.play.google.com/store/apps/details?id=com.chekslate.giftor',
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
                  child: Container(
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
                              fontFamily: GoogleFonts.kodchasan().fontFamily,
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
