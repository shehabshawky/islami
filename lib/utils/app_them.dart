import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class AppThem {
  static final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.sacondryColor,
      type: .fixed,
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      selectedLabelStyle: AppStyle.white14bold,
    ),
    textTheme: TextTheme(headlineLarge: AppStyle.white16bold),
  );
  static ThemeData lightTheme = ThemeData();
}
