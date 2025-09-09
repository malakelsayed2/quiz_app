import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_circular_percentage.dart';
import 'package:quizapp/view/splash/widgets/custom_navigationbar.dart';
import '../../../core/resources/Models/questionModel/question_list.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/string_manager.dart';
import '../widgets/custom_question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<dynamic> userAnswers = List.filled(QuestionList.questionList.length, null);
  int? selectedValue;
  int questionNumber = 0;


  int _rightAnswers(){
    Set set1 = userAnswers.toSet();
    Set set2 = {} ;
    for(int i = 0 ; i < QuestionList.questionList.length ; i++){
      set2.add(QuestionList.questionList[i].correctAnswer);
    }

    Set intersection = set1.intersection(set2);
    return intersection.length ;
  }

  // New: This function handles the navigation and data passing
  void _navigateToResults() {
    Navigator.pushReplacementNamed(
      context,
      RouteStringManager.resultScreen,
      arguments: {

        StringManagerQuiz.userAnswers: userAnswers,
        StringManagerQuiz.userCorrectAnswers : _rightAnswers(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "${questionNumber + 1}/${QuestionList.questionList.length}",
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(ColorMangager.quizBackground),
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(PaddingSize.pad10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Height.h50),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomQuestionCard(
                    question: QuestionList.questionList[questionNumber].question,
                  ),
                  Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    // New: Pass the callback function to the timer widget
                    child: CustomCircularPercentage(
                      onFinish: () => _navigateToResults(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Height.h50),
              SizedBox(
                height: Height.h500,
                child: ListView.separated(
                  padding: EdgeInsets.all(PaddingSize.pad15),
                  itemCount:
                  QuestionList.questionList[questionNumber].answers.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<int>(
                      value: index,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        userAnswers[questionNumber] = QuestionList.questionList[questionNumber].answers[value!];
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      title: Text(
                        QuestionList.questionList[questionNumber].answers[index],
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.font20,
                        ),
                      ),
                      activeColor: Color(ColorMangager.mainColor),
                      tileColor: selectedValue == index
                          ? Color(ColorMangager.mainColor).withOpacity(0.3)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Radius.rad25),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: PaddingSize.pad16,
                        vertical: PaddingSize.pad10,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(height: Height.h15),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: questionNumber != QuestionList.questionList.length - 1
          ? CustomNavigationbar(
        text: StringManagerQuiz.next,
        function: selectedValue == null
            ? () {}
            : () {
          setState(() {
            questionNumber++;
            selectedValue = null;
          });
        },
        colorButton: selectedValue == null
            ? Colors.grey
            : Color(ColorMangager.mainColor),
        colorText: Colors.white,
      )
          : CustomNavigationbar(
        text: StringManagerQuiz.finish,
        function: selectedValue == null
            ? () {}
            : () {
          // New: Call the new navigation function
          _navigateToResults();
        },
        colorButton: selectedValue == null
            ? Colors.grey
            : Color(ColorMangager.mainColor),
        colorText: Colors.white,
      ),
    );
  }
}
