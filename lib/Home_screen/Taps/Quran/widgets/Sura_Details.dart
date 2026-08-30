import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home_screen/Taps/Quran/widgets/Aya_border.dart';
import 'package:islami/Models/quran_Resorces.dart';
import 'package:islami/providers/Most_Recent_Provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late MostRecentProvider mostRecentprovider;
  List<String> vierses = [];
  @override
  Widget build(BuildContext context) {
    mostRecentprovider = Provider.of<MostRecentProvider>(context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (vierses.isEmpty) {
      LoadAsset(index);
    }
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
        title: Text(QuranResorces.englishQuranSurahsList[index]),
      ),
      body: vierses.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: AppColor.sacondryColor),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.suraDetailsPG),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 52),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: .stretch,
                    children: [
                      Text(
                        textAlign: .center,
                        QuranResorces.arabicAuranSurasList[index],
                        style: AppStyle.gold20bold,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return AyaBorder(
                              text: vierses[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: vierses.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void LoadAsset(int index) async {
    String sura = await rootBundle.loadString(
      "assets/files/Suras/${index + 1}.txt",
    );
    List<String> suraLins = sura.split('\n');

    vierses = suraLins;

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    mostRecentprovider.getRecentData();
  }
}
