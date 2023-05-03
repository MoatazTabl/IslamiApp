import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Brightness.light == Theme.of(context).brightness
                  ? "assets/images/main_bg.png"
                  : "assets/images/dark_bg.png"),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.suraName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!.copyWith(fontSize: 35),
            ),
            centerTitle: true,
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                      child: RichText(

                        textDirection: TextDirection.rtl,
                        textAlign: verses.length <= 20
                            ? TextAlign.center
                            : TextAlign.justify,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: verses[index],
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                                text: '\u06dd${index + 1}',
                                style: GoogleFonts.amiri(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 25))
                          ],
                        ),
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
    String sura =
        await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    setState(() {});
  }
}
