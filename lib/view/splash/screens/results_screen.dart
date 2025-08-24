import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/size_manager.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(PaddingSize.pad15),
              alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(Radius.rad25),
                color: Colors.green,
              ),
              child: Text("1"),
            ),
            Container(
              padding: EdgeInsets.all(PaddingSize.pad15),
              alignment: Alignment.center,
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(Radius.rad25),
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Question hgkhjfekfkw;kf kfjlrflkwf ofkwpofkpowf owfkop",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Divider(),
                  Container(
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
                          "Correct Answer",
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.check_circle, color: Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
