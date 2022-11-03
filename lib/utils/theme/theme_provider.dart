import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/utils/injector/project_injector.dart';
import 'package:flutter_challenge/utils/theme/shared_preference_helper.dart';
import 'package:flutter_challenge/utils/theme/theme.dart' as t;

class ThemeProvider with ChangeNotifier {
  ThemeData theme = t.Theme().darkTheme;
  bool isDark = getIt<SharedPreferenceHelper>().isdark;

  void toggle(BuildContext context) {
    isDark = !isDark;
    getIt<SharedPreferenceHelper>().setThemeMode(isDark, context);
    setTheme();
    notifyListeners();
  }

  // bool get getIsDark => getIt<SharedPreferenceHelper>().isdark;
  Future<ThemeData> getTheme() async => getIt<SharedPreferenceHelper>().isdark
      ? t.Theme().darkTheme
      : t.Theme().lightTheme;

  ThemeData get themeData => theme;

  setTheme() async {
    theme = await getTheme();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: themeData.appBarTheme.backgroundColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: themeData.brightness,
        systemStatusBarContrastEnforced: true,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    notifyListeners();
  }
}
