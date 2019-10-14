import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    "3 + 5 = 7",
    "6 + 11 = 17",
    "16 + 21 = 37"
  ];
  List<bool> answers = [false, true, true];

  int questionNumber = 0;
  String getQuestion() {
    if (questions.length > questionNumber) {
      return questions[questionNumber];
    }
    return "Finished";
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (answers[questionNumber]) {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }
                  questionNumber += 1;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (answers[questionNumber]) {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  } else {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  }
                  questionNumber += 1;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
