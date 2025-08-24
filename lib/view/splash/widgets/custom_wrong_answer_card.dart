import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/size_manager.dart';
import 'custom_result_answer_field.dart';

class CustomWrongAnswer extends StatelessWidget {
  final String question;
  final int questionNumber ;
  final String correctAnswer ;
  const CustomWrongAnswer({super.key, required this.question, required this.questionNumber, required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(PaddingSize.pad15),
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:Colors.black45,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(Radius.rad25),
            color: Colors.red,
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
          height: 250,
          width: 350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(Radius.rad25),
            color: Colors.red,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                question,
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(thickness: 2,),
              CustomResultAnswerField(Answer: "Wrong Answer", color: Colors.red, icon: CupertinoIcons.xmark_circle_fill,),
              CustomResultAnswerField(Answer: correctAnswer, color: Colors.green, icon: Icons.check_circle,),
            ],
          ),
        ),
      ],
    );
  }
}
