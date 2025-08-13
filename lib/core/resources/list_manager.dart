
import '../../view/splash/widgets/onbording_widget.dart';

class OnBoardingListManager {
  static const List<OnboardingWidget> list = [
    OnboardingWidget(
      image: 'assets/images/onboard1.png',
      text: 'Synonyms for QUIZ',
      subtext: 'Synonyms for QUIZ',
    ),
    OnboardingWidget(
      image: 'assets/images/onboard2.png',
      text: 'Antonyms of QUIZ',
      subtext: 'Sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    OnboardingWidget(
      image: 'assets/images/onboard3.png',
      text: 'Cool QUIZ',
      subtext: 'Culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];
}

class QuizAnswerListManager {
  static List<String> list = ["1990" ,"1980" ,"1970" ,"1960"];
}
