import 'package:quizapp/core/resources/Models/questionModel/question_model.dart';

class QuestionList {
  static List<QuestionModel> questionList = [
    QuestionModel(
        "What is the capital of France?",
        ["Paris", "London", "Berlin", "Madrid"],
        "Paris"
    ),
    QuestionModel(
        "Which programming language is used in Flutter?",
        ["Java", "Dart", "Python", "C++"],
        "Dart"
    ),
    QuestionModel(
        "Who developed the theory of relativity?",
        ["Isaac Newton", "Albert Einstein", "Galileo Galilei", "Nikola Tesla"],
        "Albert Einstein"
    ),
    QuestionModel(
        "Which planet is known as the Red Planet?",
        ["Earth", "Mars", "Venus", "Jupiter"],
        "Mars"
    ),
    QuestionModel(
        "What is the largest ocean on Earth?",
        ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean", "Arctic Ocean"],
        "Pacific Ocean"
    ),
  ];

}
