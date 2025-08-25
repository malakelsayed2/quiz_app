import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import '../../../core/resources/color_manager.dart';

class CustomCircularPercentage extends StatefulWidget {
  // Add a new final variable for the callback function
  final VoidCallback onFinish;

  // Update the constructor to require the onFinish callback
  const CustomCircularPercentage({
    super.key,
    required this.onFinish,
  });

  @override
  State<CustomCircularPercentage> createState() =>
      _CustomCircularPercentageState();
}

class _CustomCircularPercentageState extends State<CustomCircularPercentage> {
  StreamController timerStreamController = StreamController();

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  void dispose() {
    // Make sure to close the stream controller when the widget is disposed
    timerStreamController.close();
    super.dispose();
  }

  void timer() {
    for (int i = 0; i < 30; i++) {
      Future.delayed(Duration(seconds: i), () {
        // We check if the stream is still open before adding data
        if (!timerStreamController.isClosed) {
          timerStreamController.add(i);
        }
      });
    }

    // After 30 seconds, call the provided onFinish callback
    Future.delayed(const Duration(seconds: 30), () {
      // Check if the widget is still in the tree before calling the callback
      if (mounted) {
        widget.onFinish();
      }
    });
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
            // Use snapshot.data as the source of the timer value
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
