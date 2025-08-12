import 'package:flutter/cupertino.dart';
import 'package:quizapp/view/splash/screens/login_screen.dart';
import 'package:quizapp/view/splash/screens/quiz_screen.dart';
import '../../view/splash/screens/onboarding_screen.dart';
import '../../view/splash/screens/spalsh_screen.dart';

class RouteStringManager {
  static const String splashScreen = "SplashScreen";
  static const String onBoardingScreen = "OnBoardingScreen";
  static const String loginScreen = "LoginScreen";
  static const String quizScreen = "quizScreen";

}

class RouteMap {
  static Map<String, WidgetBuilder> routeMap = {
    RouteStringManager.splashScreen: (context)=>SpalshScreen(),
    RouteStringManager.onBoardingScreen: (context)=>OnboardingScreen(),
    RouteStringManager.loginScreen: (context)=>LoginScreen(),
    RouteStringManager.quizScreen: (context)=>QuizScreen(),

  };
}
