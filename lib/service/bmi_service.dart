import 'dart:math';

class BMIService {
  int weight;
  int height;
  double _bmi;

  BMIService({this.weight, this.height});

  String getResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMILabel() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You need to eat less!';
    } else if (_bmi >= 18.5) {
      return 'Your weight is absolutely normal!';
    } else {
      return 'You need to eat more!';
    }
  }
}
