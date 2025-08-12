import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/resources/color_manager.dart';

class CustomCircularPercentage extends StatelessWidget {
  const CustomCircularPercentage({super.key, required this.text});
  final String text ;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 50,
      child: CircularPercentIndicator(
        animation: true,
        restartAnimation: true,
        animationDuration: 2000,
        radius: 50,
        percent: 1,
        center: Text(
          text,
          style: GoogleFonts.quicksand(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        progressColor: Color(ColorMangager.mainColor),
        lineWidth: 7,
      ),
    );
  }
}
