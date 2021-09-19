import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'question.dart';
import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
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

  void checkAnswer(bool userPickedAnswer) {
    bool coorrectAnswer = quizBrain.getQuestionAnswer();

    //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If true, execute Part A, B, C, D.
    //TODO: Step 4 Part A - show an alert using rFlutter_alert (remember to read the docs for the package!)

    //HINT! Step 4 Part B is in the quiz_brain.dart

    //TODO: Step 4 Part C - reset the questionNumber,
    //TODO: Step 4 Part D - empty out the scoreKeeper.

    //TODO: Step 5 - If we've not reached the end, ELSE do the answer checking steps below 👇

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: "Hi Nick",
                desc: "You are indeed at the end of the quiz")
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      } else if (userPickedAnswer == coorrectAnswer) {
        //print('User got it Right');
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        //print('User got it Wrong');
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.red,
        ));
      }

      //questionNumber++;
      quizBrain.nextQuestion();
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
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
                //showDialog(context: context);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
                //showDialog(context: context);
                //Navigator.pop(context);
                //print(questionNumber);
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

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
