import 'package:flutter_challenge/utils/theme/shared_preference_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupProjectInjector() async {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  // register singleton  -----------------------------------------------
  // getIt.registerSingleton(SharedPreferenceHelper(),
  //     signalsReady: true);

  /** SharedPreferences Helper */
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  /** Local Database Module */
}
