import 'package:flutter/material.dart';

import '../widgets/auth_background.dart';
import '../widgets/login_card.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return AuthBackground(LoginCard());
  }
}
