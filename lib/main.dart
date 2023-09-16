import 'package:flutter/material.dart';
import './pages/question_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '九九九九 - 2桁x2桁の掛け算',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuestionPage(),
    );
  }
}
