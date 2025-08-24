import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_correct_answer_card.dart';

import '../../../core/resources/size_manager.dart';
import '../widgets/custom_wrong_answer_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorMangager.mainColor),
      body: Center(
        child: CustomWrongAnswer() ,
      ),
    );
  }
}
