import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var questionCounter = 0;

  void answerQuestion() {
    questionCounter = questionCounter + 1;
    print(questionCounter);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["What is a goat? ", "What is a sheep?"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hang-man"),
        ),
        body: Column(
          children: [
            Text(questions[questionCounter]),
            // Text('$checkCorrect'),
            ElevatedButton(
              child: Text('An animal'),
              onPressed: answerQuestion,
            ),
            ElevatedButton(
              child: Text('A motor bike'),
              onPressed: answerQuestion,
            ),
            ElevatedButton(child: Text('A student'), onPressed: answerQuestion),
          ],
        ),
      ),
    );
  }
}
