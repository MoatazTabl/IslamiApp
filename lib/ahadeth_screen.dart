import 'package:flutter/material.dart';
import 'package:islami/my_themes.dart';

import 'ahadethModel.dart';

class AhadethScreen extends StatelessWidget {
  static const String routeName = "AhadethScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              Brightness.dark == Theme.of(context).brightness
                  ? "assets/images/dark_bg.png"
                  : "assets/images/main_bg.png",
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami"),
        ),
        body: Card(
          color: Brightness.dark == Theme.of(context).brightness
              ? MyThemeData.darkColor
              : Colors.white,
          margin: const EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  args.hadethName,
                  style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? MyThemeData.yellowColor
                          : Colors.black),
                ),
              ),
              Divider(
                thickness: 1,
                color: Theme.of(context).primaryColor,
                indent: 50,
                endIndent: 50,
              ),
              Text(
                args.content[0],
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
