import 'package:shared_preferences/shared_preferences.dart';

class LocalModule {
  LocalModule._();

  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}
