import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {

  final SharedPreferences prefs;

  SharedPreferenceManager._(this.prefs);

  static Future<SharedPreferenceManager> getInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return SharedPreferenceManager._(prefs);
  }

  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return prefs.getString(key);
  }
}