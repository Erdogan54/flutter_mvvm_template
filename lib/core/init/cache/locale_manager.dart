import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/locale_keys_enum.dart';

class LocaleManager {
  late SharedPreferences _pref;

  LocaleManager._() {
    SharedPreferences.getInstance().then((value) {
      _pref = value;
    });
  }

  static final LocaleManager _instance = LocaleManager._();
  static LocaleManager get instance => _instance;

  static preferencesInit() async {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (_instance._pref == null) {
      _instance._pref = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _pref.setString(key.name, value);
  }

  String getStringValue(PreferencesKeys key) => _pref.getString(key.name) ?? "null";
}
