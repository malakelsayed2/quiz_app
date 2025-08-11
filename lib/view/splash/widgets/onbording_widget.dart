import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/size_manager.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.text,
    required this.subtext,
  });

  final String image;

  final String text;

  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(height: Height.h550, image: AssetImage(image)),
        Container(
          height: Height.h150,
          padding: EdgeInsets.all(PaddingSize.pad20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: GoogleFonts.quicksand(
                  fontSize: FontSize.font30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                subtext,
                style: GoogleFonts.quicksand(fontSize: FontSize.font20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
