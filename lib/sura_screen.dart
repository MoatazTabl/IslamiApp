import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/suraDeatils.dart';

class SuraScreen extends StatefulWidget {
  const SuraScreen({Key? key}) : super(key: key);

  static const String routeName = "SuraName";

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetials;

    //check if verses empty
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_bg.png"), fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.suraName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        verses[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),

                    );
                  },
                  itemCount: verses.length,
                  shrinkWrap: true,
                ),
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    setState(() {});
  }
}
