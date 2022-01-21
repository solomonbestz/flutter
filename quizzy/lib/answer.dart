import 'package:flutter/material.dart';

class AnswerText extends StatelessWidget {
  final String answer;
  dynamic answerQuestion;

  AnswerText(this.answer, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.green, onPrimary: Colors.black),
        onPressed: answerQuestion,
        child: Text(answer),
      ),
    );
  }
}
