import 'dart:math';


class CalculatorBrain{

  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.height,this.weight});

  String calculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25)
      return 'OVERWEIGHT';
    else if(_bmi>18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String getInterpretation(){
    if(_bmi>=25)
      return 'No more fast food, just salad and gym for you';
    else if(_bmi>18.5)
      return 'Good job, keep it up!';
    else
      return 'More fast food Bro or Sis!';
  }

}