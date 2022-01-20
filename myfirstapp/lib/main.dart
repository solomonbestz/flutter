import 'package:flutter/material.dart';
import 'package:myfirstapp/quiz.dart';
import 'package:myfirstapp/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionCounter = 0;

  void _answerQuestion() {
    setState(() {
      _questionCounter = _questionCounter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = questions();
    var answer = answers();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("QUIZZY"),
          ),
        ),
        body: Column(
          children: [
            QuestionText(question[_questionCounter]),
            ElevatedButton(
              child: AnswerText(answer[_questionCounter][0]),
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
              child: AnswerText(answer[_questionCounter][1]),
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
                child: AnswerText(answer[_questionCounter][2]),
                onPressed: _answerQuestion),
          ],
        ),
      ),
    );
  }
}
