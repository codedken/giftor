import 'package:flutter/material.dart';

import './circle.dart';

class FewerStackedCircle extends StatelessWidget {
  final Color pointColor;

  FewerStackedCircle({required this.pointColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          child: Opacity(
            opacity: 0.35,
            child: Circle(color: Color(0xff4570AF), circleSize: 50.0),
          ),
        ),
        Positioned(
          top: 20.0,
          child: Opacity(
            opacity: 0.50,
            child: Circle(color: Color(0xff4570AF), circleSize: 40.0),
          ),
        ),
        Positioned(
          top: 40.0,
          child: Opacity(
            opacity: 0.55,
            child: Circle(color: Color(0xff4570AF), circleSize: 30.0),
          ),
        ),
        Positioned(
          top: 60.0,
          child: Opacity(
            opacity: 0.60,
            child: Circle(color: Color(0xff4570AF), circleSize: 20.0),
          ),
        ),
        Positioned(
          top: 80.0,
          child: Opacity(
            opacity: 0.65,
            child: Circle(color: pointColor, circleSize: 10.0),
          ),
        ),
      ],
    );
  }
}
