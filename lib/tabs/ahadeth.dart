import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ahadethModel.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadFile();
      print(allAhadeth[0].hadethName);
    }
    return ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, "");
            },
            child: Text(
              allAhadeth[index].hadethName,
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
        itemCount: allAhadeth.length);
  }

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
        print(ahadethModel.hadethName);
        allAhadeth.add(ahadethModel);
      }
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
