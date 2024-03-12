import 'package:flutter/material.dart';
import 'package:music_player_app/theme/dark_mode.dart';
import 'package:music_player_app/theme/light_mode.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

ThemeData get themeData => _themeData;

bool get isDarkMode => _themeData == darkMode;

set themeData (ThemeData themeData) {
  _themeData =themeData;

  notifyListeners();
}

void toggleTheme() {
  if(_themeData == lightMode){
    themeData = darkMode;

  }
  else {
    themeData = lightMode;
  }
}
}

