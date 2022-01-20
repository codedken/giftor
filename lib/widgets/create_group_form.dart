import 'package:giftor/constants_and_methods.dart';
import 'package:google_fonts/google_fonts.dart';

import '../my_packages/my_packages.dart';
import '../providers/group_provider.dart';
import '../providers/auth_provider.dart';
import '../models/group/group.dart';
import '../models/my_shared_preferences.dart';

class CreateGroupForm extends StatefulWidget {
  @override
  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroupForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  String _title = '';
  String _purpose = '';
  final _userData = MySharedPreferences.userData;
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _purposeController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    setState(() => _isLoading = true);
    String? currentUserId = Provider.of<AuthProvider>(
      context,
      listen: false,
    ).getCurrentUserId;

    final person = MySharedPreferences.getUser(_userData);
    String _id = nanoid(10);
    Group group = Group(
      id: _id,
      title: _title,
      purpose: _purpose,
      creatorId: currentUserId,
      creatorName: person.name,
      createdAt: DateTime.now(),
    );
    await Provider.of<GroupProvider>(
      context,
      listen: false,
    ).createGroup(currentUserId, group);
    setState(() => _isLoading = false);

    _titleController.clear();
    _purposeController.clear();
    await Future.delayed(const Duration(milliseconds: 700));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.pencilAlt,
                color: Colors.blue,
                size: 20.0,
              ),
              Expanded(
                child: Text(
                  'Create Group',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'group name',
              hintStyle: kAuthInputHintStyle,
            ),
            style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please provide group name';
              }
              return null;
            },
            onSaved: (value) {
              _title = value!.trim();
            },
          ),
          TextFormField(
            controller: _purposeController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'purpose for sharing',
              hintStyle: kAuthInputHintStyle,
            ),
            style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter purpose';
              }
              return null;
            },
            onSaved: (value) {
              _purpose = value!.trim();
            },
          ),
          const SizedBox(height: 8.0),
          Container(
            child: _isLoading
                ? Center(
                    child: LinearProgressIndicator(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff1323B4).withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 12.0,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                            ),
                            onPressed: _submitForm,
                            child: Text(
                              'Create',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffBE123C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 12.0,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
