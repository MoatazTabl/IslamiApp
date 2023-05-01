import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color lightColor = Color(0xFFB7935F);
  static const Color darkColor = Color(0xFF141A2E);
  static const Color yellowColor = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
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
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        bodySmall: GoogleFonts.elMessiri(fontSize: 20,fontWeight: FontWeight.bold,color: lightColor)),

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


          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          fixedSize: MaterialStatePropertyAll(Size(10, 20)),
          padding: MaterialStateProperty.all(EdgeInsets.zero)),

    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: darkColor,

    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: darkColor),
    ),


    textTheme: TextTheme(
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.bold, color: yellowColor),
        bodySmall: GoogleFonts.elMessiri(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: yellowColor,
        selectedLabelStyle: TextStyle(color: yellowColor),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white)),


    buttonTheme:
    ButtonThemeData(buttonColor: darkColor, highlightColor: darkColor),
    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(darkColor),


          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          fixedSize: MaterialStatePropertyAll(Size(10, 20)),
          padding: MaterialStateProperty.all(EdgeInsets.zero)),

    ),
  );
}
