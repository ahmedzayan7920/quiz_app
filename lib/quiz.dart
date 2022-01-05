import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final int _questionIndex;
  final Function(int score) answerQuestion;

  const Quiz(this._questions, this._questionIndex, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(_questions[_questionIndex]['question'].toString()),
        ...(_questions[_questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'].toString(), ()=>answerQuestion(int.parse(answer['score'].toString())));
        }),
      ],
    );
  }
}
