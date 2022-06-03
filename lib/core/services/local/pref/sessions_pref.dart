import 'package:nl_web/core/di/di_module.dart';
import 'package:nl_web/core/services/local/pref/pref_key.dart';
import 'package:nl_web/core/services/local/pref/shared_preferences_manager.dart';

class SessionPref {
  static void saveSession({required String accessToken}) {
    var preferencesManager = sl.get<SharedPreferencesManager>();
    preferencesManager.putString(keyAccessToken, accessToken);
  }

  static String? getAccessToken() =>
      sl.get<SharedPreferencesManager>().getString(keyAccessToken);

  static bool isSessionValid() {
    return sl
            .get<SharedPreferencesManager>()
            .getString(keyAccessToken)
            ?.isNotEmpty ==
        true;
  }
}
