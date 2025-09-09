import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/app/quizz_app.dart';
import 'package:quizapp/core/resources/Models/user_details_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => userDetailsModel(),
      child: QuizzApp(),
    ),
  );
}
