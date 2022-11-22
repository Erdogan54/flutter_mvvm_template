import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/locale_keys_enum.dart';

class LocaleManager {
  SharedPreferences? _pref;

  LocaleManager._() {
    SharedPreferences.getInstance().then((value) {
      _pref = value;
    });
  }

  static final LocaleManager _instance = LocaleManager._();
  static LocaleManager get instance => _instance;

  static preferencesInit() async {
    return _instance._pref ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
   await _pref?.clear();
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _pref?.setString(key.name, value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _pref?.setBool(key.name, value);
  }

  String getStringValue(PreferencesKeys key) => _pref?.getString(key.name) ?? "null";

  bool getBoolValue(PreferencesKeys key) => _pref?.getBool(key.name) ?? false;
}
