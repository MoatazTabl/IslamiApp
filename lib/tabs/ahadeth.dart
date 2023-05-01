import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_pic.png"),
          Divider(
            thickness: 3,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            "الأحاديث",
            style: GoogleFonts.amiri(color: Theme.of(context).primaryColor),
          ),
          Divider(
            thickness: 3,
            color: Theme.of(context).primaryColor,
          ),
          ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "");
                  },
                  child: Text(
                    allAhadeth[index].hadethName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(color: Theme.of(context).primaryColor),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor,
                  ),
              itemCount: allAhadeth.length),
        ],
      ),
    );
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
        allAhadeth.add(ahadethModel);
      }
      setState(() {});
    }).catchError((error) {
    });
  }
}
