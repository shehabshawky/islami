import 'package:flutter/material.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) => Material(
    color: AppColor.primaryColor.withValues(alpha: .84),
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$title selected'))),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.sacondryColor, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 185, height: 185),
            const SizedBox(height: 21),
            Text(title, style: AppStyle.white16bold),
          ],
        ),
      ),
    ),
  );
}
