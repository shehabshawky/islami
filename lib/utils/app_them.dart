import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';

class AppThem {
  static final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.sacondryColor,
      type: .fixed,
      selectedItemColor: AppColor.whiteColor,
      selectedIconTheme: IconThemeData(color: AppColor.whiteColor),
      unselectedItemColor: AppColor.blackColor,
    ),
  );
  static ThemeData lightTheme = ThemeData();
}
