import 'package:flutter/material.dart';
import 'dart:math';

class MyMario extends StatelessWidget {
  final direction;
  final midrun;
  final size;

  MyMario({this.direction, this.midrun, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
          width: size,
          height: size,
          child: midrun
              ? Image.asset('lib/images/standingmario.png')
              : Image.asset('lib/images/runningmario.png'));
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: size,
          height: size,
          child: midrun
              ? Image.asset('lib/images/standingmario.png')
              : Image.asset('lib/images/runningmario.png'),
        ),
      );
    }
  }
}
