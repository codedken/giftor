import 'package:flutter/material.dart';

import '../constants_and_methods.dart';

class HomeButton extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final Widget? btnIcon;
  final VoidCallback onTap;

  HomeButton({
    this.btnColor = Colors.blue,
    required this.btnText,
    required this.onTap,
    this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          fixedSize: Size.fromWidth(getHomeButtonWidth(context)),
          primary: btnColor,
          elevation: 16.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        icon: btnIcon!,
        label: Text(
          btnText,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
