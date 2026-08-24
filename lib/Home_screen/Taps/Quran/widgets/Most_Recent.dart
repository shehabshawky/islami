import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class MostRecent extends StatelessWidget {
  const MostRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      width: 280,
      height: 150,
      decoration: BoxDecoration(
        color: AppColor.sacondryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: .spaceEvenly,

        children: [
          Column(
            crossAxisAlignment: .start,
            spacing: 5,
            children: [
              Text("Al-Anbiya", style: AppStyle.black24bold),
              Text("الأنبياء", style: AppStyle.black24bold),
              Text("112 Verses", style: AppStyle.black14bold),
            ],
          ),
          Image.asset(AppAssets.mostRecent),
        ],
      ),
    );
  }
}
