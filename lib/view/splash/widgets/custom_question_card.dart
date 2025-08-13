import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/size_manager.dart';

class CustomQuestionCard extends StatelessWidget {
  const CustomQuestionCard({super.key, required this.question});
  final String question ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(PaddingSize.pad15),
      alignment: Alignment.center,
      height: Height.h300,
      width: Width.wid400,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey , offset: Offset(0, 10), blurRadius: 10)],
          borderRadius: BorderRadius.circular(Radius.rad25),
          color: Colors.white
      ),
      child: Text(question, style: GoogleFonts.quicksand(fontSize: FontSize.font20, fontWeight: FontWeight.bold),),
    );
  }
}
