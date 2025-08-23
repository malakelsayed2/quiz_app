import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_circular_percentage.dart';
import '../../../core/resources/list_manager.dart';
import '../widgets/custom_question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    String userName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "7/10",
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
                    question: 'Hello Answer this question please',
                  ),
                  Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    child: CustomCircularPercentage(text: "30"),
                  ),
                ],
              ),
              SizedBox(height: Height.h50),
              SizedBox(
                height: Height.h500,
                child: ListView.separated(
                  // physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(PaddingSize.pad15),
                  itemCount: QuizAnswerListManager.list.length,
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
                        QuizAnswerListManager.list[index],
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.font20,
                        ),
                      ),
                      activeColor: Color(ColorMangager.mainColor),
                      // Purple radio
                      tileColor: selectedValue == index? Color(ColorMangager.mainColor).withOpacity(0.3):Colors.white,
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
                  separatorBuilder:(context,index) => Container(height: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}