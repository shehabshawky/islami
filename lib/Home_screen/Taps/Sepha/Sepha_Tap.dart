import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/utils/app_style.dart';

class SephaTap extends StatefulWidget {
  SephaTap({super.key});

  @override
  State<SephaTap> createState() => _SephaTapState();
}

class _SephaTapState extends State<SephaTap> {
  double angle = 0;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int currantzekr = 0;
  int carruntint = 0;
  String getzekr(int index) {
    if (index > 33) {
      carruntint = 0;
      currantzekr = (currantzekr + 1) % azkar.length;
    }
    return azkar[currantzekr];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: 18),
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: AppStyle.white36bold),
        SizedBox(
          height: 80,
          child: Stack(
            alignment: .topCenter,
            children: [
              Positioned(
                top: 1,
                child: Image.asset(
                  "assets/images/sephaHead.png",
                  width: 145,
                  height: 90,
                  fit: .cover,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              carruntint++;
              getzekr(carruntint);
              angle += 15;
              setState(() {});
            },
            child: Stack(
              alignment: .topCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "assets/images/SebhaBody.png",
                      width: 380,
                      height: 380,
                      fit: .contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 380,
                  child: Column(
                    crossAxisAlignment: .stretch,
                    mainAxisAlignment: .center,
                    spacing: 30,
                    children: [
                      Text(
                        azkar[currantzekr],
                        style: AppStyle.white36bold,
                        textAlign: .center,
                      ),
                      Text(
                        carruntint.toString(),
                        style: AppStyle.white36bold,
                        textAlign: .center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
