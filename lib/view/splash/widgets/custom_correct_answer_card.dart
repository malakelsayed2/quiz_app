import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/Models/questionModel/question_list.dart';
import 'package:quizapp/view/splash/widgets/custom_result_answer_field.dart';

import '../../../core/resources/size_manager.dart';

class CustomCorrectAnswer extends StatelessWidget {

  final String question;
  final int questionNumber ;
  final String correctAnswer ;
  const CustomCorrectAnswer({super.key, required this.question, required this.questionNumber, required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(PaddingSize.pad15),
          alignment: Alignment.center,
          height: Height.h50,
          width: Width.wid50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:Colors.black45,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(Radius.rad25),
            color: Colors.green,
          ),
          child: Text(
            questionNumber.toString(),
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(PaddingSize.pad15),
          alignment: Alignment.center,
          height: Height.h200,
          width: Width.wid350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(Radius.rad25),
            color: Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                question,
                style: GoogleFonts.quicksand(
                  fontSize: FontSize.font20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(thickness: 2,),
              CustomResultAnswerField(answer: correctAnswer, color: Colors.green, icon: Icons.check_circle,),
            ],
          ),
        ),
      ],
    );
  }
}
