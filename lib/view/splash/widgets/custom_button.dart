import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/size_manager.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.function,
    this.colorText,
    this.colorButton= Colors.white,
    this.fontweight,
  });
  final String text;
  final VoidCallback function;
  Color? colorText;
  Color? colorButton;
  FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(PaddingSize.pad10),
      width: Width.wid400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Radius.rad40),
        color: colorButton,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: GoogleFonts.quicksand(
            fontSize: FontSize.font25,
            color: colorText,
            fontWeight: fontweight,
          ),
        ),
      ),
    );
  }
}
