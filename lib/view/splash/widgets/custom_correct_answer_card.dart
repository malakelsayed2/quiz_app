import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/view/splash/widgets/custom_result_answer_field.dart';

import '../../../core/resources/size_manager.dart';

class CustomCorrectAnswer extends StatelessWidget {
  const CustomCorrectAnswer({Key? key}) : super(key: key);

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
            color: Colors.green,
          ),
          child: Text(
            "1",
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(PaddingSize.pad15),
          alignment: Alignment.center,
          height: 200,
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
            color: Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Question hgkhjfekfkw;kf kfjlrflkwf ofkwpofkpowf owfkop",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(),
              CustomResultAnswerField(Answer: "Correct Answer", color: Colors.green, icon: Icons.check_circle,),
            ],
          ),
        ),
      ],
    );
  }
}
