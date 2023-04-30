import 'package:flutter/material.dart';
import 'package:islami/suraDeatils.dart';

class SuraScreen extends StatelessWidget {
  const SuraScreen({Key? key}) : super(key: key);

  static const String routeName = "SuraName";

  @override
  Widget build(BuildContext context) {
    var args =ModalRoute.of(context)?.settings.arguments as SuraDetials;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main_bg.png"),
            fit: BoxFit.fill
          ),

        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Islami",
            ),

          ),
          body: Center(child: Text(args.suraName,style: Theme.of(context).textTheme.bodyMedium,)),
        ),
      ),
    );
  }
}
