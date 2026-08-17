import 'package:flutter/material.dart';
import 'package:islami/Home_screen/Home_screen.dart';
import 'package:islami/utils/app_Routs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
initialRoute: AppRouts.homeRouteName,
routes: {
AppRouts.homeRouteName :(context) => HomeScreen(),
},
    );
  }
}


