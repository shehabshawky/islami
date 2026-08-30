import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Taps/Hadith/wedgits/Hadith_Item.dart';
import 'package:islami/utils/app_color.dart';

class HadithTap extends StatelessWidget {
  HadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: hight * 0.66,
        disableCenter: true,
        clipBehavior: Clip.hardEdge,
        enlargeCenterPage: true,
      ),
      items: List.generate(50, (index) => index + 1).map((int index) {
        return HadithItem(index: index);
      }).toList(),
    );
  }
}
