import 'package:flutter/material.dart';

class DarkData extends ChangeNotifier {
  bool isDark=false;

  void toggleDarkTheme(){
    isDark = !isDark;
    print(isDark);
    notifyListeners();
  }

}