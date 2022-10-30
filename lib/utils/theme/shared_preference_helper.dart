import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_challenge/utils/injector/project_injector.dart';
import 'package:flutter_challenge/utils/theme/strings.dart';
import 'package:flutter_challenge/utils/theme/theme.dart' as t;
import 'package:flutter_challenge/utils/theme/theme_provider.dart';

class SharedPreferenceHelper {
  final _preferences = SharedPreferences.getInstance();

   Future<void> setThemeMode(bool value, BuildContext context) async {
    final SharedPreferences sharedPreference = await _preferences;
    await sharedPreference.setBool(Strings.themeMode, value);
  }

  Future<bool> get isdark async => await _preferences
      .then((value) => value.getBool(Strings.themeMode) ?? false);
}
