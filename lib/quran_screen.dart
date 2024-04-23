import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth.dart';
import 'package:islami/tabs/quran.dart';
import 'package:islami/tabs/sebha.dart';
import 'package:islami/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranScreen extends StatefulWidget {
  static const String routeName = "QuranScreen";

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int index = 0;
  List<Widget>tabs=[QuranTab(),SebhaTab(),AhadethTab(),SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(Brightness.dark==Theme.of(context).brightness?
          "assets/images/dark_bg.png":"assets/images/main_bg.png",fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
          Scaffold(
            appBar: AppBar(
              title:  Text(
                AppLocalizations.of(context)!.appTitle,
              ),

            ),
            body: tabs[index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items:  [
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/moshaf.png")),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/ahadeth.png")),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
