import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You are here';
    if (resultScore <= 3) {
      resultText = 'You are Okay!';
    } else if (resultScore <= 5) {
      resultText = 'You are Good!';
    } else if (resultScore <= 7) {
      resultText = 'You are Too Good!';
    } else {
      resultText = 'You are perfect!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
