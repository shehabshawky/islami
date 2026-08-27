import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Home_screen.dart';
import 'package:islami/Home_screen/Taps/Hadith/wedgits/Hadith_Details.dart';
import 'package:islami/Home_screen/Taps/Quran/Sura_Details.dart';
import 'package:islami/intro_screen/intro_screen.dart';
import 'package:islami/utils/app_Routs.dart';
import 'package:islami/utils/app_them.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'islami',
      theme: AppThem.lightTheme,
      darkTheme: AppThem.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRouts.homeRouteName,
      routes: {
        AppRouts.introRouteName: (context) => IntroScreen(),
        AppRouts.homeRouteName: (context) => HomeScreen(),
        AppRouts.suraDetailsRouteName: (context) => SuraDetails(),
        AppRouts.hadithDetailsRouteName: (context) => HadithDetails(),
      },
    );
  }
}
