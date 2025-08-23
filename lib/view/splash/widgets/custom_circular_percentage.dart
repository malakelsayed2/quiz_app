import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/view/splash/screens/quiz_screen.dart';

import '../../../core/resources/color_manager.dart';

class CustomCircularPercentage extends StatefulWidget {
  const CustomCircularPercentage({super.key});

  @override
  State<CustomCircularPercentage> createState() =>
      _CustomCircularPercentageState();
}

class _CustomCircularPercentageState extends State<CustomCircularPercentage> {
  StreamController timerStreamController = StreamController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 30; i++) {
      Future.delayed(Duration(seconds: i), () {
        timerStreamController.add(i);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: Radius.rad50,
      child: CircularPercentIndicator(
        animation: true,
        restartAnimation: true,
        animationDuration: 30000,
        radius: Radius.rad50,
        percent: 1,
        center: StreamBuilder(
          stream: timerStreamController.stream,
          builder: (context, snapshot) => Text(
            snapshot.data == null ? "0" : snapshot.data.toString(),
            style: GoogleFonts.quicksand(
              fontSize: FontSize.font30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        progressColor: Color(ColorMangager.mainColor),
        lineWidth: 7,
      ),
    );
  }
}
