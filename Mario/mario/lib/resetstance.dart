import 'dart:math';

import 'package:flutter/material.dart';

class ResetStance extends StatelessWidget {
  final direction;

  ResetStance({this.direction});
  
  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return Container(
          width: 50,
          height: 50,
          child: Image.asset('lib/images/standingmario.png'));
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            width: 50,
            height: 50,
            child: Image.asset('lib/images/standingmario.png')),
      );
    }
  }
}
