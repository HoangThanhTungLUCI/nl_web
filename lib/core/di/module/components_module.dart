import 'package:nl_web/core/di/di_module.dart';
import 'package:nl_web/core/services/local/pref/shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentsModule extends DIModule {
  @override
  provides() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton(SharedPreferencesManager(sharedPreferences));
  }
}
