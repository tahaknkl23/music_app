import 'package:flutter/material.dart';
import 'package:music_app/themes/dark_moda.dart';
import 'package:music_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Başlangıçta ışık modu olarak ayarlandı
  ThemeData _themeData = lightMode;

  // Tema için getter
  ThemeData get getTheme => _themeData;

  // Temanın karanlık mod olup olmadığını kontrol eder
  bool isDarkMode() {
    return _themeData == darkMode;
  }

  // Tema değiştirme metodu
  setTheme(ThemeData themeData) {
    _themeData = themeData;
    // Temayı güncelle ve dinleyicilere bildir
    notifyListeners();
  }

  // Tema değiştirme toggle metodu
  void toggleTheme() {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}
