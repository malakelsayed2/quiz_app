import 'package:flutter/material.dart';
import 'package:quizapp/core/resources/route_manager.dart';


class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RouteMap.routeMap,
      initialRoute: RouteStringManager.splashScreen,);
  }
}
