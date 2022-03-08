import 'dart:math';

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final child;
  final function;
  static bool holdingbutton = false;

  MyButton({this.child, this.function});

  bool userIsHoldingButton() {
    return holdingbutton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingbutton = true;
        function();
      },
      onTapUp: (details) {
        holdingbutton = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.brown[300],
          child: child,
        ),
      ),
    );
  }
}
