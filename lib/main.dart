import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionindex = 0;
  var _totalScore=0;
  final _questions = const [
    {
      'questiontext': 'What\'s your favoutite color? ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red ', 'score': 5},
        {'text': 'Green', 'score': 8},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questiontext': 'What\'s your favoutite animal? ',
      'answers': [
        {'text': 'Lion', 'score': 6},
        {'text': 'Rabbit ', 'score': 2},
        {'text': 'Snake', 'score': 10},
        {'text': 'Dog', 'score': 1}
      ],
    },
    {
      'questiontext': 'Who\'s your favoutite instructor? ',
      'answers': [
        {'text': 'Prateek', 'score': 4},
        {'text': 'Manish ', 'score': 10},
        {'text': 'Rana', 'score': 5},
        {'text': 'Rahul', 'score': 1}
      ],
    },
  ];
  

  void _answerQuestion(int score) {
    _totalScore=_totalScore+score;


    setState(() {
      _questionindex = _questionindex + 1;
    });
    if (_questionindex < _questions.length) {
      print('We have more questions !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionindex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionindex: _questionindex,
                questions: _questions)
            : Result(_totalScore),
      ),
    );
  }
}
