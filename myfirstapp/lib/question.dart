import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String questionText;
  QuestionText(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AnswerText extends StatelessWidget {
  final String answer;

  AnswerText(this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        answer,
        style: TextStyle(fontSize: 13, backgroundColor: Colors.red,),
        textAlign: TextAlign.center,
        
      ),
    );
  }
}
