import 'package:shared_preferences/shared_preferences.dart';

void saveLastSuraIndex(int newSuraName) async {
  var sharedPref = await SharedPreferences.getInstance();
  List<String> mostRecentList = sharedPref.getStringList("Most_Recent") ?? [];
  String indexStr = newSuraName.toString();
  mostRecentList.remove(indexStr);
  mostRecentList.insert(0, indexStr);
  await sharedPref.setStringList("Most_Recent", mostRecentList);
}


Future<List<int>> getRecentData() async {
  var sharedPref = await SharedPreferences.getInstance();
  List<String> mostRecent = sharedPref.getStringList("Most_Recent") ?? [];
  List<int> mostRecentByInt = mostRecent.map((e) => int.parse(e)).toList();
  return mostRecentByInt;
}
  