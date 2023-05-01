import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loadFile();
    return Column(
      children: [],
    );
  }

  void loadFile() async {
    rootBundle
        .loadString("assets/files/ahadeth/ahadeth.txt")
        .then((ahadethFile) {
      List<String> ahadethcontent = ahadethFile.split("#");

      for (int i = 0; i < ahadethcontent.length; i++) {
        List<String> singleHadethLine = ahadethcontent[i].trim().split("\n");

        String title = singleHadethLine[0];

        singleHadethLine.removeAt(0);

        List<String> content = singleHadethLine;
      }
    }).catchError((error) {
      print(error);
    });
  }
}
