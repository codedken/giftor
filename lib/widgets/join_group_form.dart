import '../my_packages/my_packages.dart';

import '../providers/group_provider.dart';
import '../providers/auth_provider.dart';

class JoinGroupForm extends StatefulWidget {
  @override
  _JoinGroupFormState createState() => _JoinGroupFormState();
}

class _JoinGroupFormState extends State<JoinGroupForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _groupCode = '';
  String errorText = '';
  bool isTextEmpty = true;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final joinGroupProvider = Provider.of<GroupProvider>(
      context,
      listen: false,
    );
    final authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    final isGroupExists = await joinGroupProvider.isGroupExists(_groupCode);
    if (isGroupExists == false) {
      setState(() {
        isTextEmpty = false;
        errorText = 'Group does not exist';
      });
      return;
    }
    setState(() {
      isTextEmpty = true;
      errorText = '';
    });
    try {
      await joinGroupProvider.addMember(
        authProvider.getCurrentUserId,
        _groupCode,
      );
    } catch (e) {
      setState(() {
        isTextEmpty = false;
        errorText = 'You are a member of this group';
      });
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.users,
                color: Colors.blue,
                size: 20.0,
              ),
              Expanded(
                child: Text(
                  'Join Group',
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
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter Code',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  setState(() {
                    isTextEmpty = true;
                    errorText = '';
                  });
                  return 'Please enter group code';
                }
                return null;
              },
              onSaved: (value) {
                _groupCode = value!.trim();
              }),
          if (isTextEmpty == false)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                errorText,
                style: TextStyle(color: Colors.red[700], fontSize: 12.0),
              ),
            ),
          const SizedBox(height: 8.0),
          Row(
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
                    onPressed: _submit,
                    child: Text(
                      'Join',
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
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
