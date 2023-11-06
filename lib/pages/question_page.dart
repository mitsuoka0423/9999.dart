import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';


class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int number1 = 0;
  int number2 = 0;
  List<int> options = [];
  int correctAnswer = 0;
  String feedback = '';

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    Random random = Random();
    number1 = 11 + random.nextInt(9);
    number2 = 11 + random.nextInt(9);
    correctAnswer = number1 * number2;

    // Generating wrong answers
    Set<int> wrongAnswers = {};
    while (wrongAnswers.length < 3) {
      int tensVary = (random.nextInt(3) + 1) * 10; // Generate 10, 20, or 30
      int wrong = random.nextBool()
          ? correctAnswer + tensVary
          : correctAnswer - tensVary;
      if (wrong != correctAnswer && wrong > 0) {
        wrongAnswers.add(wrong);
      }
    }

    options = [correctAnswer, ...wrongAnswers];
    options.shuffle(random);
  }

  void handleAnswer(int option) {
    if (option == correctAnswer) {
      setState(() {
        feedback = '正解';
      });
      Future.delayed(Duration(seconds: 2), () {
        generateQuestion();
        setState(() {
          feedback = '';
        });
      });
    } else {
      setState(() {
        feedback = 'ぶっぶー';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('一問一答 - 九九九九')),
      body: Center(
        child: TextButton(
          // ボタンを押した時のイベント
          onPressed: () {
            // データの取得
            FirebaseFirestore.instance
                .collection('flutterDataCollection')
                .doc('Gld0l88ZN8vHHm7J0MJZ')
                .get()
                .then((ref) {
              print(ref.get("mydata"));
            });
            FirebaseFirestore.instance
                .collection('flutterDataCollection')
                .add({'autofield': "xyz"});
          },
          child: const Text(
            '実行',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
