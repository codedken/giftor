import 'package:flutter/material.dart';
import 'package:giftor/constants_and_methods.dart';
import 'package:giftor/models/error_handler.dart';
import 'package:giftor/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class DelConfirmDialog extends StatefulWidget {
  @override
  _DelConfirmDialogState createState() => _DelConfirmDialogState();
}

class _DelConfirmDialogState extends State<DelConfirmDialog> {
  late TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _showErrorWidget = false, _isLoading = false;

  @override
  void initState() {
    _passwordController.addListener(() {
      setState(() {
        _showErrorWidget = false;
        _errorMessage = '';
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _delete() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      _errorMessage = '';
      _showErrorWidget = false;
      _isLoading = true;
    });
    if (_passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a password';
        _showErrorWidget = true;
        _isLoading = false;
      });
      return;
    }
    try {
      await authProvider.confirmUser(
        authProvider.getCurrentUserEmail!,
        _passwordController.text,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = AuthExceptionHandler.generateExceptionMessage(
          AuthExceptionHandler.getExceptionStatus(e),
        );
        _showErrorWidget = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      actions: _isLoading
          ? [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: LinearProgressIndicator(),
          )]
          : [
              ElevatedButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: _delete,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.close),
                label: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff1323B4).withOpacity(0.9),
                ),
              )
            ],
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'You are about to delete your account.',
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: kAuthInputHintStyle,
            ),
            obscureText: true,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            child: _showErrorWidget
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : null,
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
