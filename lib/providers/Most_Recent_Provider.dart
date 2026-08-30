import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecent = [];
  void getRecentData() async {
    var sharedPref = await SharedPreferences.getInstance();
    List<String> mostRecentList = sharedPref.getStringList("Most_Recent") ?? [];
    mostRecent = mostRecentList.map((e) => int.parse(e)).toList();
    notifyListeners();
  }
}
