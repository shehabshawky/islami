import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/utils/app_Routs.dart';
import 'package:islami/utils/app_color.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset("assets/images/introhead.png"),
              width: 291,
              height: 171,
            ),
            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: AppColor.primaryColor,
                pages: [
                  PageViewModel(
                    titleWidget: Text(
                      "Welcome To Islmi App",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    bodyWidget: Container(),
                    image: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/intro1.png",
                        fit: .contain,
                      ),
                    ),
                    decoration: const PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Welcome To Islmi App",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    bodyWidget: Text(
                      textAlign: .center,
                      "We Are Very Excited To Have You In Our Community",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 19,
                      ),
                    ),
                    image: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/intro2.png",
                        fit: .contain,
                      ),
                    ),
                    decoration: const PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Welcome To Islmi",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    bodyWidget: Text(
                      textAlign: .center,
                      "Read, and your Lord is the Most Generous",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 19,
                      ),
                    ),
                    image: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/intro3.png",
                        fit: .contain,
                      ),
                    ),
                    decoration: const PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Welcome To Islmi App",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    bodyWidget: Text(
                      textAlign: .center,
                      "Praise the name of your Lord, the Most High",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 19,
                      ),
                    ),
                    image: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/intro4.png",
                        fit: .contain,
                      ),
                    ),
                    decoration: const PageDecoration(imageFlex: 3),
                  ),
                  PageViewModel(
                    titleWidget: Text(
                      "Welcome To Islmi App",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    bodyWidget: Text(
                      textAlign: .center,
                      "You can listen to the Holy Quran Radio through the application for free and easily",
                      style: TextStyle(
                        color: AppColor.sacondryColor,
                        fontSize: 19,
                      ),
                    ),
                    image: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/intro5.png",
                        fit: .contain,
                      ),
                    ),
                    decoration: const PageDecoration(imageFlex: 3),
                  ),
                ],
                showNextButton: true,
                next: Text(
                  "Next",
                  style: TextStyle(
                    color: AppColor.sacondryColor,
                    fontSize: 13,
                    fontWeight: .bold,
                  ),
                ),
                showBackButton: true,
                back: Text(
                  "Back",
                  style: TextStyle(
                    color: AppColor.sacondryColor,
                    fontSize: 13,
                    fontWeight: .bold,
                  ),
                ),
                dotsDecorator: DotsDecorator(
                  color: Color(0XFF707070),
                  activeColor: AppColor.sacondryColor,
                  spacing: EdgeInsets.symmetric(horizontal: 3),
                  activeSize: Size(20, 10),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

                done: const Text(
                  "Done",
                  style: TextStyle(
                    color: AppColor.sacondryColor,
                    fontSize: 13,
                    fontWeight: .bold,
                  ),
                ),
                onDone: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouts.homeRouteName,
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
