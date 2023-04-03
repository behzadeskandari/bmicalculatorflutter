import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height = 0, this.weight = 0});

  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body wieght. try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight good job';
    } else {
      return 'you have a lower than normal body weight. you can eat a bit more';
    }
  }
}
