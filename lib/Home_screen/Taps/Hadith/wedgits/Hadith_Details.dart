import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Aya_border.dart';
import 'package:islami/Models/Hadith_Model.dart';
import 'package:islami/Models/quran_Resorces.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class HadithDetails extends StatelessWidget {
  HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadith =
        ModalRoute.of(context)?.settings.arguments as HadithModel;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        titleTextStyle: AppStyle.gold20bold,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColor.sacondryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(hadith.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.suraDetailsPG)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 52,
              left: 25,
              right: 25,
              bottom: 90,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    textAlign: .center,
                    hadith.body,
                    style: AppStyle.gold20bold,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
