import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunchService {
  static const _key = 'hasOpenedApp';

  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final hasOpened = prefs.getBool(_key) ?? false;
    return !hasOpened;
  }

  static Future<void> markOpened() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
