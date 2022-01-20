import 'package:flutter/material.dart';
import './rounded_circle_group.dart';

class FooterCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'footer-circles',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedCircleGroup(
            primaryColor: Color(0xffAF455F),
            pointColor: Color(0xffffffff),
          ),
          RoundedCircleGroup(
            primaryColor: Color(0xff4563AF),
            pointColor: Color(0xffffffff),
          ),
        ],
      ),
    );
  }
}
