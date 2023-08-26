import 'package:flutter/material.dart';
import '../domains/question.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.title});

  final String title;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int answer = -1;
  Question question = Question();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9999 - 大人の掛け算'),
      ),
      body: Container(
          color: Colors.white70,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Text(question.ask()),
              Text(answer == question.multiplication?.product ? '正解' : 'ぶっぶー'),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '答えを入力してください',
                ),
                onChanged: (input) {
                  setState(() {
                    if (int.tryParse(input) != null) {
                      answer = int.parse(input);
                    }
                  });
                },
              ),
            ],
          )),
    );
  }
}
