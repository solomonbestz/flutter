import 'package:flutter/material.dart';
import 'package:mario/button.dart';
import 'package:mario/mario.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX = 0;
  static double marioY = 1;
  double time = 0;
  double height = 0;
  double initial_height = marioY;
  String direction = 'Right';
  bool midrun = false;

  void preJump() {
    time = 0;
    initial_height = marioY;
  }

  void jump() {
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;

      if (initial_height - height > 1) {
        setState(() {
          marioY = 1;
        });
      } else {
        setState(() {
          marioY = initial_height - height;
        });
      }
    });
  }

  void moveRight() {
    direction = "right";
    midrun = !midrun;
    setState(() {
      marioX += 0.02;
    });
  }

  void moveLeft() {
    direction = "left";
    midrun = !midrun;
    setState(() {
      marioX -= 0.02;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          flex: 4,
          child: Container(
            color: Colors.blue,
            child: AnimatedContainer(
              alignment: Alignment(marioX, marioY),
              duration: Duration(milliseconds: 0),
              child: MyMario(
                direction: direction,
                midrun: midrun,
              ),
            ),
          )),
      Expanded(
          flex: 1,
          child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  function: moveLeft,
                ),
                MyButton(
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  function: jump,
                ),
                MyButton(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  function: moveRight,
                ),
              ],
            ),
          ))
    ]));
  }
}
