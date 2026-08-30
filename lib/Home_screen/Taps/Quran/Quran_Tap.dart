import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Most_Recent_Itme.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Most_Recent_Wid.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Sura_List_item.dart';
import 'package:islami/Models/quran_Resorces.dart';
import 'package:islami/cash/Shared_Pref.dart';
import 'package:islami/utils/app_Routs.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List filterdList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              TextFormField(
                cursorColor: AppColor.whiteColor,
                style: TextStyle(color: AppColor.whiteColor),
                onChanged: (value) {
                  shearchByName(value);
                },
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: AppStyle.white16bold,
                  prefixIcon: Image.asset(
                    AppAssets.quranIcon,
                    color: AppColor.sacondryColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.sacondryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.sacondryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MostRecentWid(),
              SizedBox(height: 20),
              Text(
                "Sura List",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 20),
              filterdList.isEmpty
                  ? Text("There is no result found", style: AppStyle.gold20bold)
                  : ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SuraListItem(
                          index: filterdList[index],
                          ontap: () {
                            saveLastSuraIndex(filterdList[index]);
                            Navigator.pushNamed(
                              context,
                              AppRouts.suraDetailsRouteName,
                              arguments: filterdList[index],
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(endIndent: 40, indent: 40),
                      itemCount: filterdList.length,
                    ),
            ]),
          ),
        ],
      ),
    );
  }

  void shearchByName(String suraname) {
    List shearchList = [];
    for (int i = 0; i < filterdList.length; i++) {
      if (QuranResorces.englishQuranSurahsList[i].toLowerCase().contains(
        suraname.toLowerCase(),
      )) {
        shearchList.add(i);
      }

      if (QuranResorces.arabicAuranSurasList[i].toLowerCase().contains(
        suraname.toLowerCase(),
      )) {
        shearchList.add(i);
      }
    }

    filterdList = shearchList;
    if (suraname.isEmpty) {
      filterdList = List.generate(114, (index) => index);
    }
    setState(() {});
  }
}
