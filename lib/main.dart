import 'package:flutter/material.dart';
import 'package:islami/ahadeth_screen.dart';
import 'package:islami/my_themes.dart';
import 'package:islami/quran_screen.dart';
import 'package:islami/sura_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: QuranScreen.routeName,
      routes: {
        QuranScreen.routeName:(context)=>QuranScreen(),
        SuraScreen.routeName:(c)=>SuraScreen(),
        AhadethScreen.routeName:(c)=>AhadethScreen(),
      },
    );
  }
}
