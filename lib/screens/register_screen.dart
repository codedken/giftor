import 'package:flutter/material.dart';

import '../widgets/auth_background.dart';
import '../widgets/register_card.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register_screen';

  @override
  Widget build(BuildContext context) {
    return AuthBackground(RegisterCard());
  }
}
