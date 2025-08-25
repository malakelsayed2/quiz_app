import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/Models/questionModel/question_list.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/route_manager.dart';
import 'package:quizapp/view/splash/screens/quiz_screen.dart';
import 'package:quizapp/view/splash/widgets/custom_correct_answer_card.dart';
import 'package:quizapp/view/splash/widgets/custom_navigationbar.dart';

import '../../../core/resources/size_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_wrong_answer_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String userName = args['userName'];
    final List<dynamic> userAnswers = args['userAnswers'];

    int answer = 0;

    return Scaffold(
      backgroundColor: Color(ColorMangager.mainColor),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(PaddingSize.pad15),
              margin: EdgeInsetsGeometry.all(15),
              alignment: Alignment.center,
              height: 150,
              width: 450,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(Radius.rad25),
                color: Colors.white,
              ),
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name : $userName",
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: Color(ColorMangager.mainColor),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Grade : 4 / ${QuestionList.questionList.length} ",
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: Color(ColorMangager.mainColor),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (answer == 1) {
                    return CustomCorrectAnswer(
                      question: QuestionList.questionList[index].question,
                      questionNumber: index + 1,
                    );
                  }
                  return CustomWrongAnswer(
                    question: QuestionList.questionList[index].question,
                    questionNumber: index + 1,
                    correctAnswer:
                        QuestionList.questionList[index].correctAnswer, wrongAnswer: userAnswers[index] ,
                  );
                },
                separatorBuilder: (context, index) => Container(height: 30),
                itemCount: QuestionList.questionList.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationbar(
        text: "Retake Quiz",
        function: () => Navigator.pushReplacementNamed(
          context,
          RouteStringManager.loginScreen,
        ),
        colorButton: Colors.white,
        colorText: Color(ColorMangager.mainColor),
      ),

    );
  }
}
