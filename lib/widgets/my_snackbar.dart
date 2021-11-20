import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final String? body;

  MySnackBar(this.body);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        body!,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      backgroundColor: Colors.white,
    );
  }
}
