import '../models/error_handler.dart';
import '../my_packages/my_packages.dart';
import '../providers/auth_provider.dart';

import '../constants_and_methods.dart';
import '../widgets/auth_button.dart';
import '../screens/screens.dart';

class ResetPasswordCard extends StatefulWidget {
  @override
  State<ResetPasswordCard> createState() => _ResetPasswordCardState();
}

class _ResetPasswordCardState extends State<ResetPasswordCard> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  String _email = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() => _isLoading = true);
    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).resetPassword(_email);

      _showAlertBox(
        context: context,
        dialogType: AlertType.none,
        title: '',
        body: 'A password reset link has been sent to your email',
      );
    } on FirebaseException catch (e) {
      print(e);
      _showAlertBox(
        context: context,
        dialogType: AlertType.none,
        title: '',
        body: AuthExceptionHandler.generateExceptionMessage(
          AuthExceptionHandler.getExceptionStatus(e),
        ),
      );
    }
    _emailController.clear();
    setState(() => _isLoading = false);
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
            'Ok',
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
    return Container(
      width: getAuthContainerWidth(context),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Reset your password to continue sharing gifts',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: _emailController,
                style: kAuthInputTextStyle,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: kAuthInputHintStyle,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.envelope,
                    color: kTextColorWithOpacity,
                    size: 20.0,
                  ),
                  contentPadding: kAuthInputPadding,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!.trim();
                },
              ),
              SizedBox(height: 10.0),
              AuthButton(
                btnColor: Color(0xff1323B4),
                btnText: 'RESET',
                onTap: _submit,
                isLoading: _isLoading,
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RegisterScreen.routeName,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(
                      context,
                      LoginScreen.routeName,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
