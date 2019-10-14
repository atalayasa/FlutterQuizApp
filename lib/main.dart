import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

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
  int correctAnswerCount = 0;
  int wrongAnswerCount = 0;

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Tebrikler",
      desc:
          "Yarışma bitti doğru cevap sayınız: $correctAnswerCount, yanlış cevap sayınız: $wrongAnswerCount",
      buttons: [
        DialogButton(
          child: Text(
            "Try Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isQuizFinished()) {
        showAlert();
        quizBrain.reset();
        scoreKeeper = [];
        wrongAnswerCount = 0;
        correctAnswerCount = 0;
      } else {
        if (userPickedAnswer == quizBrain.getCorrectAnswer()) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          correctAnswerCount++;
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          wrongAnswerCount++;
        }
      }
    });
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
                quizBrain.getQuestion(),
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
                "Doğru",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              onPressed: () {
                checkAnswer(true);
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
                "Yanlış",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              onPressed: () {
                checkAnswer(false);
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
