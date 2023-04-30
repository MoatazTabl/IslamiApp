import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightColor = Color(0xFFB7935F);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: lightColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: lightColor),
    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: lightColor),
        bodySmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: lightColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white)),
    buttonTheme:
        ButtonThemeData(buttonColor: lightColor, highlightColor: lightColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(lightColor),
          // shape: MaterialStateProperty.all(
          //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          fixedSize: MaterialStatePropertyAll(Size(10,20)),
          padding: MaterialStateProperty.all(EdgeInsets.zero)),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
