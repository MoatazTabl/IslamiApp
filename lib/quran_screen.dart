import 'package:flutter/material.dart';
import 'package:islami/tabs/ahadeth.dart';
import 'package:islami/tabs/quran.dart';
import 'package:islami/tabs/radio.dart';
import 'package:islami/tabs/sebha.dart';
import 'package:islami/tabs/settings_tab.dart';

class QuranScreen extends StatefulWidget {
  static const String routeName = "QuranScreen";

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int index = 0;
  List<Widget>tabs=[QuranTab(),SebhaTab(),AhadethTab(),RadioTab(),SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(Brightness.dark==Theme.of(context).brightness?
          "assets/images/dark_bg.png":"assets/images/main_bg.png",fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
          Scaffold(
            appBar: AppBar(
              title: const Text(
                "Islami",
              ),

            ),
            body: tabs[index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/moshaf.png")),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                    label: "Ahadeth"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio"),
              BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Settings"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
