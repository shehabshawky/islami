import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Models/Hadith_Model.dart';
import 'package:islami/utils/app_Routs.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_style.dart';

class HadithItem extends StatefulWidget {
  final int index;

  HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;
  @override
  void initState() {
    loudfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return hadith == null
        ? Center(
            child: CircularProgressIndicator(color: AppColor.sacondryColor),
          )
        : InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              AppRouts.hadithDetailsRouteName,
              arguments: hadith,
            ),
            child: Container(
              padding: .only(left: 25, right: 25, top: 50),
              decoration: BoxDecoration(
                color: AppColor.sacondryColor,
                borderRadius: .circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/images/HadithItemPG.png"),
                  fit: .contain,
                ),
              ),
              child: ClipRRect(
                borderRadius: .circular(20),
                child: Column(
                  children: [
                    Text(
                      hadith!.title,
                      style: AppStyle.black20bold,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 20),
                    Text(
                      hadith!.body,
                      style: AppStyle.black16bold,
                      maxLines: 15,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void loudfile() async {
    String hadithBody = await rootBundle.loadString(
      "assets/files/Hadeeth/h${widget.index}.txt",
    );
    String title = hadithBody.substring(0, hadithBody.indexOf("\n"));
    String body = hadithBody.substring(hadithBody.indexOf("\n"));
    hadith = HadithModel(body: body, title: title);
    setState(() {});
  }
}
