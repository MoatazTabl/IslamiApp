import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier
{
  ThemeMode themeMode=ThemeMode.system;
  String languageCode='en';

  void changeTheme(ThemeMode theme)
  {
    themeMode=theme;
    notifyListeners();
  }

  void changeLanguage(String language)
  {
    languageCode=language;
    notifyListeners();
  }
}