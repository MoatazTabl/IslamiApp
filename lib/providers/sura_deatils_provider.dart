import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  void loadFile(int index) {
    // String sura =
    // await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    // List<String> lines = sura.split("\n");
    // verses = lines;

    rootBundle.loadString("assets/files/quran/${index + 1}.txt").then(
      (suraFile) {
        List<String> sura = suraFile.split("\n");

        verses = sura;
        notifyListeners();
      },
    ).catchError((error) {
      print(error);
    });
  }
}
