import 'package:flutter/material.dart';

import '../widgets/circle.dart';

class RoundedCircleGroup extends StatelessWidget {
  final Color primaryColor;
  final Color pointColor;

  RoundedCircleGroup({required this.primaryColor, required this.pointColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: 0.30,
          child: Circle(
            color: primaryColor,
            circleSize: 80.0,
          ),
        ),
        Opacity(
          opacity: 0.40,
          child: Circle(
            color: primaryColor,
            circleSize: 60.0,
          ),
        ),
        Opacity(
          opacity: 0.50,
          child: Circle(
            color: primaryColor,
            circleSize: 40.0,
          ),
        ),
        Opacity(
          opacity: 0.60,
          child: Circle(
            color: pointColor,
            circleSize: 10.0,
          ),
        ),
      ],
    );
  }
}
