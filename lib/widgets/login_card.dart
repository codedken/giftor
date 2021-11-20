import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../providers/auth_provider.dart';
import '../models/error_handler.dart';
import '../widgets/auth_button.dart';
import '../screens/screens.dart';

import '../constants_and_methods.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isLoading = false;
  bool _displayPassword = true;

  void _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);
    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).signIn(email, password);
      await Future.delayed(const Duration(milliseconds: 600));
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName,
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      final statusCode = AuthExceptionHandler.getExceptionStatus(e);
      setState(() => _isLoading = false);
      await Future.delayed(const Duration(milliseconds: 500));
      _showAlertBox(
        context: context,
        dialogType: AlertType.error,
        title: null,
        body: AuthExceptionHandler.generateExceptionMessage(statusCode),
      );
    }
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
            'Cancel',
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

  void _showPassword() {
    setState(() => _displayPassword = !_displayPassword);
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
                'Kindly login to share love with someone',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              TextFormField(
                style: kAuthInputTextStyle,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: kAuthInputHintStyle,
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: kAuthErrorStyle,
                  prefixIcon: Icon(
                    FontAwesomeIcons.envelope,
                    color: Color(0xff000000).withOpacity(0.3),
                  ),
                  contentPadding: kAuthInputPadding,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a registered email address';
                  }
                  if (!value.contains('@')) {
                    return 'Provide a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!.trim();
                },
              ),
              SizedBox(height: 6.0),
              TextFormField(
                style: kAuthInputTextStyle,
                obscureText: _displayPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: kAuthInputHintStyle,
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: kAuthErrorStyle,
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Color(0xff000000).withOpacity(0.3),
                    size: 28.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xff000000).withOpacity(0.3),
                    ),
                    onPressed: _showPassword,
                  ),
                  contentPadding: kAuthInputPadding,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 6.0),
              AuthButton(
                btnColor: Color(0xff1323B4),
                btnText: 'SIGN IN',
                onTap: _signIn,
                isLoading: _isLoading,
              ),
              SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      RegisterScreen.routeName,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      ResetPasswordScreen.routeName,
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
