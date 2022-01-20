import 'package:flutter/material.dart';

import '../widgets/auth_background.dart';
import '../widgets/reset_password_card.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = '/reset_password_screen';

  @override
  Widget build(BuildContext context) {
    return AuthBackground(ResetPasswordCard());
  }
}
