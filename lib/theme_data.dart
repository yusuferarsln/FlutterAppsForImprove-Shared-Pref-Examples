import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    buttonColor: Colors.green.shade300,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    buttonColor: Colors.red.shade300,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  bool _isGreen = true;

  static SharedPreferences? _sharedPrefObject;


  bool get isGreen {
    return _isGreen;
  }

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSharedPref(_isGreen);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPrefObject!.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() async {
    _isGreen = _sharedPrefObject!.getBool('themeData') ?? true;
  }
}