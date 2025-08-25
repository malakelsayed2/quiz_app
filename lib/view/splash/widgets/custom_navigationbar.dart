import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomNavigationbar extends StatelessWidget {
  final String text ;
  final VoidCallback function ;
  final Color colorButton ;
  final Color colorText ;
  const CustomNavigationbar({super.key, required this.text, required this.function, required this.colorButton, required this.colorText});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsetsGeometry.all(25),
      child :CustomButton(
        text: text,
        function: function ,
        colorButton: colorButton,
        colorText: colorText,
        fontweight: FontWeight.bold,
      ),
    );
  }
}
