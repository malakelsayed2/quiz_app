import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/core/resources/Models/questionModel/question_list.dart';
import 'package:quizapp/core/resources/Models/user_details_model.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/route_manager.dart';
import 'package:quizapp/core/resources/string_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_correct_answer_card.dart';
import 'package:quizapp/view/splash/widgets/custom_navigationbar.dart';
import '../../../core/resources/size_manager.dart';
import '../widgets/custom_wrong_answer_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String userName = Provider.of<userDetailsModel>(context).userName ;
    final List<dynamic> userAnswers = args[StringManagerQuiz.userAnswers];
    final int userCorrectAnswers = args[StringManagerQuiz.userCorrectAnswers] ;


    return Scaffold(
      backgroundColor: Color(ColorMangager.mainColor),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(PaddingSize.pad15),
              margin: EdgeInsetsGeometry.all(PaddingSize.pad15),
              alignment: Alignment.center,
              height: Height.h150,
              width: Width.wid450,
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
                width: Width.wid400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${StringManagerResults.name} : ${userName}",
                      style: GoogleFonts.quicksand(
                        fontSize: FontSize.font25,
                        color: Color(ColorMangager.mainColor),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${StringManagerResults.grade} : $userCorrectAnswers / ${QuestionList.questionList.length} ",
                      style: GoogleFonts.quicksand(
                        fontSize:FontSize.font25,
                        color: Color(ColorMangager.mainColor),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Height.h20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (userAnswers[index] ==
                      QuestionList.questionList[index].correctAnswer) {
                    return CustomCorrectAnswer(
                      question: QuestionList.questionList[index].question,
                      questionNumber: index + 1,
                      correctAnswer:
                          QuestionList.questionList[index].correctAnswer,
                    );
                  }
                  return CustomWrongAnswer(
                    question: QuestionList.questionList[index].question,
                    questionNumber: index + 1,
                    correctAnswer:
                        QuestionList.questionList[index].correctAnswer,
                    wrongAnswer: userAnswers[index] ?? "",
                  );
                },
                separatorBuilder: (context, index) => Container(height: Height.h30),
                itemCount: QuestionList.questionList.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationbar(
        text: StringManagerResults.retakeQuiz,
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
