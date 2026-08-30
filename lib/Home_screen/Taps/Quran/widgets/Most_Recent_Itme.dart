import 'package:flutter/material.dart';
import 'package:islami/Models/quran_Resorces.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class MostRecent extends StatelessWidget {
  final int index;
  const MostRecent({super.key, required this.index});

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
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 5,
              children: [
                Text(
                  QuranResorces.englishQuranSurahsList[index],
                  style: AppStyle.black24bold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  QuranResorces.arabicAuranSurasList[index],
                  style: AppStyle.black24bold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  QuranResorces.ayaNumberList[index],
                  style: AppStyle.black14bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Image.asset(AppAssets.mostRecent),
        ],
      ),
    );
  }
}
