import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/theme/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final SharedPreferences _preferences;

  SharedPreferenceHelper(this._preferences);
  Future<void> setThemeMode(bool value, BuildContext context) async {
    await _preferences.setBool(Strings.themeMode, value);
  }

  // bool get isdark async => await _preferences
  //   .getBool(Strings.themeMode) ?? false);

  bool get isdark => _preferences.getBool(Strings.themeMode) ?? false;

  // bool getIsDark() async{
  //   return Future.value(isdark);
  // }
}
