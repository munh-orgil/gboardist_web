import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static set(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  static get(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static clear() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
