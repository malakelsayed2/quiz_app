import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/core/resources/string_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/resources/list_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../widgets/onbording_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pagecontroller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: Height.h900,
            child: PageView.builder(
              controller: pagecontroller,
              itemCount: OnBoardingListManager.list.length,
              itemBuilder: (context, index) => OnboardingWidget(
                image: OnBoardingListManager.list[index].image,
                text: OnBoardingListManager.list[index].text,
                subtext: OnBoardingListManager.list[index].subtext,
              ),
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentPage != OnBoardingListManager.list.length - 1)
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteStringManager.loginScreen,
                    );
                  },
                  child: SizedBox(
                    width: Width.wid50,
                    child: Text(
                      StringManagerOnBoard.skip,
                      style: GoogleFonts.quicksand(
                        fontSize: FontSize.font20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              else
                SizedBox(width: Width.wid50),
              SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  activeDotColor: Color(ColorMangager.mainColor),
                ),
                controller: pagecontroller,
                count: OnBoardingListManager.list.length,
              ),
              TextButton(
                onPressed: () {
                  if (currentPage == OnBoardingListManager.list.length - 1) {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteStringManager.loginScreen,
                    );
                  } else {
                    pagecontroller.nextPage(
                      duration: Duration(milliseconds: 60),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  currentPage == OnBoardingListManager.list.length - 1
                      ? StringManagerOnBoard.finish
                      : StringManagerOnBoard.next,
                  style: GoogleFonts.quicksand(
                    fontSize: FontSize.font20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
