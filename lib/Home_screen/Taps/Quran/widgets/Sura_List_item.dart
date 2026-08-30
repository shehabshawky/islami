import 'package:flutter/material.dart';
import 'package:islami/Models/quran_Resorces.dart';
import 'package:islami/utils/app_Routs.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_style.dart';

class SuraListItem extends StatelessWidget {
  final int index;
  final VoidCallback ontap;
  const SuraListItem({super.key, required this.index, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 52,
        height: 52,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.soraNum),
              fit: .cover,
            ),
          ),
          child: Center(
            child: Text("${index + 1}", style: AppStyle.white20bold),
          ),
        ),
      ), // widget on the left
      title: Text(
        QuranResorces.englishQuranSurahsList[index],
        style: AppStyle.white20bold,
      ), // main text
      subtitle: Text(
        QuranResorces.ayaNumberList[index],
        style: AppStyle.white16bold,
      ), // secondary text below title
      trailing: Text(
        QuranResorces.arabicAuranSurasList[index],
        style: AppStyle.white20bold,
      ), // widget on the right
      onTap: ontap,
    );
  }
}
