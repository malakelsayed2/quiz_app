import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/resources/size_manager.dart';

class CustomResultAnswerField extends StatelessWidget {
  final String answer ;
  final Color color ;
  final IconData icon ;
  const CustomResultAnswerField({Key? key, required this.answer, required this.color, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(right: PaddingSize.pad20, left: PaddingSize.pad20),
      alignment: Alignment.centerLeft,
      height: Height.h40,
      width: Width.wid350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Radius.rad25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            answer,
            style: GoogleFonts.quicksand(
              fontSize: FontSize.font20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon( icon , color: color,),
        ],
      ),
    );
  }
}
