import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ahadethModel.dart';

class AhadethProvider extends ChangeNotifier
{
  List<AhadethModel> allAhadeth = [];

  void loadFile() {
    rootBundle
        .loadString("assets/files/ahadeth/ahadeth.txt")
        .then((ahadethFile) {
      List<String> ahadethcontent = ahadethFile.split("#");

      for (int i = 0; i < ahadethcontent.length; i++) {
        List<String> singleHadethLine = ahadethcontent[i].trim().split("\n");

        String title = singleHadethLine[0];
        singleHadethLine.removeAt(0);

        List<String> content = singleHadethLine;
        // print(content);

        AhadethModel ahadethModel = AhadethModel(title, content);
        allAhadeth.add(ahadethModel);
      }
      notifyListeners();
    }).catchError((error) {
    });
  }
}