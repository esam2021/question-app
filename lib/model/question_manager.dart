import 'package:question_app/model/question.dart';

class QuestionManager {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(1, true, 20, "https://picsum.photos/200",
        "is Damascus the capital of syria"),
    Question(2, false, 30, "https://picsum.photos/201",
        "is Amman the capital of Egypt"),
    Question(3, false, 50, "https://picsum.photos/202",
        "is Madrid the capital of Lebanon"),
  ];

  Question getCurrentQuestion() {
    return _questionBank[_questionNumber];
  }

  // int getQuestionId() {
  //   return _questionBank[_questionNumber].id;
  // }

  // String getQuestionText() {
  //   return _questionBank[_questionNumber].questionText;
  // }

  // String getQuestionImage() {
  //   return _questionBank[_questionNumber].imageUrl;
  // }

  // int getQuestionPoint() {
  //   return _questionBank[_questionNumber].point;
  // }

  // bool getQuestionAnswer() {
  //   return _questionBank[_questionNumber].answer;
  // }

  int getQuestionCount() => _questionBank.length;

  bool nextQuestion() {
    if (_questionNumber < getQuestionCount() - 1) {
      _questionNumber++;
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
