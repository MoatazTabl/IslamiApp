import 'package:flutter/material.dart';
import 'package:islami/ahadeth_screen.dart';
import 'package:islami/my_themes.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/quran_screen.dart';
import 'package:islami/sura_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,

      initialRoute: QuranScreen.routeName,
      routes: {
        QuranScreen.routeName: (context) => QuranScreen(),
        SuraScreen.routeName: (c) => const SuraScreen(),
        AhadethScreen.routeName: (c) => AhadethScreen(),
      },

      localizationsDelegates:  const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale:  Locale(provider.languageCode),
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
    );
  }
}
