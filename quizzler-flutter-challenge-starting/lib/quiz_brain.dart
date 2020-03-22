import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(qText:'Some cats are actually allergic to humans', qAnswer: true),
    Question(qText:'You can lead a cow down stairs but not up stairs.', qAnswer: false),
    Question(qText:'Approximately one quarter of human bones are in the feet.', qAnswer: true),
    Question(qText:'A slug\'s blood is green.', qAnswer: true),
    Question(qText:'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', qAnswer: true),
    Question(qText:'It is illegal to pee in the Ocean in Portugal.', qAnswer: true),
    Question(qText:
        'No piece of square dry paper can be folded in half more than 7 times.',
        qAnswer:false),
    Question(qText:
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        qAnswer:true),
    Question(qText:
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        qAnswer:false),
    Question(qText:
        'The total surface area of two human lungs is approximately 70 square metres.',
        qAnswer:true),
    Question(qText:'Google was originally called \"Backrub\".', qAnswer: true),
    Question(qText:
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        qAnswer:true),
    Question(qText:
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        qAnswer:true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.
    return _questionNumber == _questionBank.length-1;
  }
  //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

  //TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset(){
      _questionNumber = 0;
  }
}
