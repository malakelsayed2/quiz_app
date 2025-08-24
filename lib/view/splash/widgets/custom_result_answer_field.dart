import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/resources/size_manager.dart';

class CustomResultAnswerField extends StatelessWidget {
  final String Answer ;
  final Color color ;
  final IconData icon ;
  const CustomResultAnswerField({Key? key, required this.Answer, required this.color, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(5),
      alignment: Alignment.centerLeft,
      height: 40,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Radius.rad25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            Answer,
            style: GoogleFonts.quicksand(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon( icon , color: color,),
        ],
      ),
    );
  }
}
