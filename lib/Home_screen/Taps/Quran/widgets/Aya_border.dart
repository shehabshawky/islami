import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class AyaBorder extends StatelessWidget {
  final String text;
  const AyaBorder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: .circular(15),
          border: BoxBorder.all(color: AppColor.sacondryColor, width: 1.5),
        ),
        child: Text(textAlign: .center, text, style: AppStyle.gold20bold),
      ),
    );
  }
}
