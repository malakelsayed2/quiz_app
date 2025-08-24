import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_correct_answer_card.dart';

import '../../../core/resources/size_manager.dart';
import '../widgets/custom_wrong_answer_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String userName = ModalRoute
    //     .of(context)!
    //     .settings
    //     .arguments as String;

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
                      // "Name : $userName",
                      "No",
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                        color: Color(ColorMangager.mainColor),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Grade : 4 / 4",
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
          ],
        ),
      ),
    );
  }
}
