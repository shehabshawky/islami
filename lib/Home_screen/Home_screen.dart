import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Taps/Hadith/Hadith_Tap.dart';
import 'package:islami/Home_screen/Taps/Quran/Quran_Tap.dart';
import 'package:islami/Home_screen/Taps/Radio/Radio_Tap.dart';
import 'package:islami/Home_screen/Taps/Sepha/Sepha_Tap.dart';
import 'package:islami/Home_screen/Taps/Time/Time_Tap.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_them.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindx = 0;
  List<Widget> taps = [
    QuranTap(),
    HadithTap(),
    SephaTap(),
    RadioTap(),
    TimeTap(),
  ];
  List<String> tapsPG = [
    AppAssets.quranPG,
    AppAssets.hadithPG,
    AppAssets.sephaPG,
    AppAssets.radioPG,
    AppAssets.timePG,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            tapsPG[selectedindx],
            fit: .cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Image.asset(AppAssets.homeLogo, width: 299, height: 141),
                Expanded(child: taps[selectedindx]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedindx = value;
          });
        },
        showUnselectedLabels: false,
        currentIndex: selectedindx,

        items: [
          showbottomnavitem(
            label: "Quran",
            imagePass: AppAssets.quranIcon,
            isSelected: selectedindx == 0,
          ),
          showbottomnavitem(
            label: "Hadith",
            imagePass: AppAssets.hadithIcon,
            isSelected: selectedindx == 1,
          ),
          showbottomnavitem(
            label: "Sepha",
            imagePass: AppAssets.sephaIcon,
            isSelected: selectedindx == 2,
          ),
          showbottomnavitem(
            label: "Radio",
            imagePass: AppAssets.radioIcon,
            isSelected: selectedindx == 3,
          ),
          showbottomnavitem(
            label: "Time",
            imagePass: AppAssets.timeIcon,
            isSelected: selectedindx == 4,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem showbottomnavitem({
    required String label,
    required String imagePass,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
              decoration: BoxDecoration(
                color: AppColor.opacetyBlackColor,
                borderRadius: BorderRadius.circular(66),
              ),

              padding: .symmetric(vertical: 6, horizontal: 19),
              child: Image.asset(
                imagePass,
                color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
                width: 24,
                height: 24,
              ),
            )
          : Image.asset(
              imagePass,
              color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
              width: 24,
              height: 24,
            ),
      label: label,
    );
  }
}
