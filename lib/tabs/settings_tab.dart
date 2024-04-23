import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/showLangaugeSheet.dart';
import 'package:islami/showThemeSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    void showThemeSheet() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          return ShowThemeSheet();
        },
      );
    }
    void showLanguageSheet() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          return ShowLanguageSheet();
        },
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              showThemeSheet();
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(provider.themeMode==ThemeMode.light?
                      "Light":"Dark"),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: (){
              showLanguageSheet();
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("English"),
                )),
          ),
        ],
      ),
    );
  }
}
