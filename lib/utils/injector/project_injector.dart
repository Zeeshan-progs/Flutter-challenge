import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_challenge/utils/local_module/local_module.dart';
import 'package:flutter_challenge/utils/theme/shared_preference_helper.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupProjectInjector() async {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  // register singleton  -----------------------------------------------
  getIt.registerSingleton(SharedPreferenceHelper(),
      signalsReady: true);
}
