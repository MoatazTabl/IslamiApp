import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Brightness.dark==Theme.of(context).brightness?
        "assets/images/dark_bg.png":"assets/images/main_bg.png",fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
        Scaffold(
          body: Column(children: [

              
            ],),
        ),
      ],
    );
  }
}
