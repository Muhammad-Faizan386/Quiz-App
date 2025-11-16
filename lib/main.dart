import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answer': [
        {'text': 'White', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Black', 'score': 3},
        {'text': 'Green', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 3},
        {'text': 'Kangaroo', 'score': 4},
      ],
    },
    {
      'questionText': 'Who\'s your favourite person?',
      'answer': [
        {'text': 'Mom', 'score': 1},
        {'text': 'Brother', 'score': 2},
        {'text': 'Sister', 'score': 3},
        {'text': 'Teacher', 'score': 4},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

void _resetQuiz(){

  setState(() {
    _totalScore=0;
    _questionIndex=0;
  });
}


  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
