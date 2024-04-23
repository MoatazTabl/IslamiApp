import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_themes.dart';
import 'package:islami/providers/sura_deatils_provider.dart';
import 'package:islami/suraDeatils.dart';
import 'package:provider/provider.dart';

class SuraScreen extends StatelessWidget {
  const SuraScreen({Key? key}) : super(key: key);

  static const String routeName = "SuraName";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetials;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    Brightness.light == Theme.of(context).brightness
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
                    .titleMedium!
                    .copyWith(fontSize: 35),
              ),
              centerTitle: true,
            ),
            body: provider.verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: RichText(
                          textDirection: TextDirection.rtl,
                          textAlign: provider.verses.length <= 20
                              ? TextAlign.center
                              : TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: provider.verses[index],
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              TextSpan(
                                text: '\u06dd${index + 1}',
                                style: GoogleFonts.amiri(
                                    color: Brightness.light ==
                                            Theme.of(context).brightness
                                        ? Theme.of(context).primaryColor
                                        : MyThemeData.yellowColor,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: provider.verses.length,
                    shrinkWrap: true,
                  ),
          ),
        );
      },
    );
  }
}
