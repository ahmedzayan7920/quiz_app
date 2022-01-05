import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': "What's your favorite color?",
      'answer': [
        {
          'text': "Red",
          'score': 15,
        },
        {
          'text': "Green",
          'score': 8,
        },
        {
          'text': "Yellow",
          'score': 2,
        },
        {
          'text': "Black",
          'score': 10,
        },
      ],
    },
    {
      'question': "What's your favorite animal?",
      'answer': [
        {
          'text': "Cat",
          'score': 15,
        },
        {
          'text': "Lion",
          'score': 8,
        },
        {
          'text': "Dog",
          'score': 2,
        },
        {
          'text': "Elephant",
          'score': 10,
        },
      ],
    },
  ];

  void answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black.withOpacity(.5),
            ),
          ],
        ),
        body: Container(
          color: isSwitched== false?Colors.white:Colors.black,
          padding: EdgeInsets.all(10),
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
