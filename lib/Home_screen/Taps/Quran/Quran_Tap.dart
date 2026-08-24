import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Most_Recent.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Sura_List_item.dart';
import 'package:islami/Models/quran_Resorces.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: MediaQuery.of(context).size.width * 0.05,
        children: [
          TextFormField(
            cursorColor: AppColor.whiteColor,
            style: TextStyle(color: AppColor.whiteColor),

            decoration: InputDecoration(
              hintText: "Sura Name",
              hintStyle: AppStyle.white16bold,
              prefixIcon: Image.asset(
                AppAssets.quranIcon,
                color: AppColor.sacondryColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.sacondryColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.sacondryColor, width: 2),
              ),
            ),
          ),
          Text(
            "Most Recently",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MostRecent();
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return SuraListItem(index: index);
              },
              separatorBuilder: (context, index) =>
                  Divider(endIndent: 40, indent: 40),
              itemCount: QuranResorces.arabicAuranSurasList.length,
            ),
          ),
        ],
      ),
    );
  }
}
