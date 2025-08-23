class QuestionModel{
  late String _question ;
  late List<dynamic> _answers ;
  late String _correctAnswer ;

  QuestionModel(this._question, this._answers, this._correctAnswer){
    List<dynamic> questionModel = [question , answers , correctAnswer];
  }

  String get correctAnswer => _correctAnswer;

  set correctAnswer(String value) {
    _correctAnswer = value;
  }

  List<dynamic> get answers => _answers;

  set answers(List<dynamic> value) {
    _answers = value;
  }

  String get question => _question;

  set question(String value) {
    _question = value;
  }


}