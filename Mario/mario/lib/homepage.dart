import 'dart:math';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:mario/button.dart';
import 'package:mario/jumpingmario.dart';
import 'package:mario/mario.dart';
import 'package:mario/mushrooms.dart';
import 'dart:async';

import 'package:mario/resetstance.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX = 0;
  static double marioY = 1;
  double mario_size = 50;
  double shroomX = 0.5;
  double shroomY = 1;
  double time = 0;
  double height = 0;
  double initial_height = marioY;
  String direction = 'Right';
  bool midrun = false;
  bool midjump = false;
  var gameFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, fontSize: 20));

  void checkateShrooms() {
    if ((marioX - shroomX).abs() < 0.05 && (marioY - shroomY).abs() < 0.05) {
      setState(() {
        // If shroom is ate remove the shroom from the screen
        shroomX = 2;
        mario_size = 60;
      });
    }
  }

  void preJump() {
    time = 0;
    initial_height = marioY;
    ResetStance(
      direction: direction,
    );
  }

  void jump() {
    // This first statement disables the double jump
    if (midjump == false) {
      midjump = true;
      preJump();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initial_height - height > 1) {
          midjump = false;
          timer.cancel();
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
  }

  void moveRight() {
    direction = "right";
    checkateShrooms();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      checkateShrooms();
      if (MyButton().userIsHoldingButton() == true && (marioX + 0.02) < 1) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        setState(() {
          Container(
              width: 50,
              height: 50,
              child: Image.asset('lib/images/standingmario.png'));
        });
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    checkateShrooms();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      checkateShrooms();
      if (MyButton().userIsHoldingButton() == true && (marioX - 0.02) > -1) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        setState(() {
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset('lib/images/standingmario.png')),
          );
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        flex: 4,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              child: AnimatedContainer(
                alignment: Alignment(marioX, marioY),
                duration: Duration(milliseconds: 0),
                child: midjump
                    ? JumpingMario(
                        direction: direction,
                        size: mario_size,
                      )
                    : MyMario(
                        direction: direction,
                        midrun: midrun,
                        size: mario_size,
                      ),
              ),
            ),
            Container(
              alignment: Alignment(shroomX, shroomY),
              child: MyShroom(),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "BESTZ MARIO",
                          style: gameFont,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "0000",
                          style: gameFont,
                        )
                      ],
                    ),
                    Column(children: [
                      Text(
                        'WORLD',
                        style: gameFont,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1-1',
                        style: gameFont,
                      )
                    ]),
                    Column(
                      children: [
                        Text(
                          'Time',
                          style: gameFont,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '9999',
                          style: gameFont,
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
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
