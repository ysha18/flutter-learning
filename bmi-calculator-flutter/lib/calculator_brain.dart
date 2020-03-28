
import 'dart:math';

class CalculatorBrain{
  int height;
  int weight;
  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculate(){
    _bmi = (weight/pow(height/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String result(){
    if(_bmi >= 25)
      return 'Overweight';
    else if(_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
    }

  String getInterpretation(){
    if(_bmi >= 25)
      return 'Exercice more bro';
    else if(_bmi > 18.5)
      return 'Good job buddy!';
    else
      return 'Chick Fil A is here to help! Don\'t hesitate';
  }

}
