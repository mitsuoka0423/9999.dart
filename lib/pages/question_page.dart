import 'package:flutter/material.dart';
import 'dart:math';

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50), // Added padding at the top
            Text(
              '$number1 x $number2 = ?',
              style: const TextStyle(fontSize: 64),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              height: 30,
              child: Center(
                child: Text(
                  feedback,
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,  // Two columns
                children: options.map((option) => ElevatedButton(
                  onPressed: () => handleAnswer(option),
                  child: Text(
                      option.toString(),
                      style: TextStyle(fontSize: 40)  // Updated font size
                  ),
                )).toList(),
                mainAxisSpacing: 10,  // vertical spacing
                crossAxisSpacing: 10,  // horizontal spacing
              ),
            ),
          ],
        ),
      ),
    );
  }
}
