import 'dart:math';
import 'package:flutter_trial/domains/Multiplication.dart';

class Question {
  Random random = Random();
  Multiplication? multiplication;

  Question([int? multiplicand, int? multiplier]) {
    multiplicand ??= random.nextInt(10) + 10;
    multiplier ??= random.nextInt(10) + 10;
    multiplication = Multiplication(multiplicand, multiplier);
  }

  String ask() {
    return '${multiplication?.multiplicand} x ${multiplication?.multiplier} は？';
  }
}
