import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_circular_percentage.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Color(0xFFEFF0F3),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey , offset: Offset(0, 10), blurRadius: 10)],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white
                  ),
                  child: Text("In what year did the United States host the FIFA World Cup for the first time?", style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Positioned(
                  top: -50,
                  left: 0,
                  right: 0,
                  child: CustomCircularPercentage(text: "30"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
