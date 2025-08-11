import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/core/resources/string_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_button.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManagerSplash.logo,
              style: GoogleFonts.quicksand(
                fontSize: FontSize.font500,
                color: Colors.white,
              ),
            ),
            CustomButton(
              text: StringManagerSplash.start,
              function: () {
                Navigator.pushReplacementNamed(
                  context,
                  RouteStringManager.onBoardingScreen,
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(ColorMangager.mainColor),
    );
  }
}
