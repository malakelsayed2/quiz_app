import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_button.dart';
import 'package:quizapp/view/splash/widgets/custom_circular_percentage.dart';
import '../../../core/resources/Models/questionModel/question_list.dart';
import '../widgets/custom_question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedValue;
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    String userName = ModalRoute
        .of(context)!
        .settings
        .arguments as String;

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
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Height.h50),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomQuestionCard(
                    question:
                    QuestionList.questionList[questionNumber].question,
                  ),
                  Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    child: CustomCircularPercentage(),
                  ),
                ],
              ),
              SizedBox(height: Height.h50),
              SizedBox(
                height: Height.h500,
                child: ListView.separated(
                  // physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(PaddingSize.pad15),
                  itemCount:
                  QuestionList.questionList[questionNumber].answers.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: index,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      title: Text(
                        QuestionList
                            .questionList[questionNumber]
                            .answers[index],
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.font20,
                        ),
                      ),
                      activeColor: Color(ColorMangager.mainColor),
                      // Purple radio
                      tileColor: selectedValue == index
                          ? Color(ColorMangager.mainColor).withOpacity(0.3)
                          : Colors.white,
                      // White background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          Radius.rad25,
                        ), // Rounded corners
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(height: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.all(25),
        child: CustomButton(
          text: "Next",
          function: selectedValue == null ? () {} : () {
            setState(() {
              questionNumber++;
              selectedValue = null;
            });
          },
          colorButton: selectedValue == null
              ? Colors.grey
              : Color(ColorMangager.mainColor),
          colorText: Colors.white,
          fontweight: FontWeight.bold,
        ),
      ),
    );
  }
}