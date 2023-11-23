import 'package:contact_app/Views/HomeView/Model/ThemeModel.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel m = ThemeModel(isDark: false);

  void Theme() {
    m.isDark = !m.isDark;
    notifyListeners();
  }
}
