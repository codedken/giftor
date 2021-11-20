import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Color color;
  final double circleSize;
  final Widget? child;
  Circle({required this.color, required this.circleSize, this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(80.0),
      child: Container(
        height: circleSize,
        width: circleSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circleSize),
        ),
        child: child,
      ),
    );
  }
}
