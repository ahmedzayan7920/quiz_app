import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function() _resetQuiz;

  Result(this._totalScore, this._resetQuiz);

  String get resultPhrase{
    String resultText;
    if (_totalScore >= 25){
      resultText = "Very Good";
    }else if(_totalScore >= 15 && _totalScore < 25){
      resultText = "Good";
    }else{
      resultText = "Bad";
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "$resultPhrase",
            style: TextStyle(fontSize: 35, color: isSwitched== false?Colors.black:Colors.white),
          ),
          Text(
            "your Result is: ${_totalScore}",
            style: TextStyle(fontSize: 35, color: isSwitched== false?Colors.black:Colors.white),
          ),
          TextButton(
              onPressed: _resetQuiz, child: Text("Restart The Quiz", style: TextStyle(fontSize: 35),))
        ],
      ),
    );
  }
}
