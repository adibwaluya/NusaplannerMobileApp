import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setDate(String date) async =>
      await _preferences?.setString('userDateEnd', date);

  static String getDate() => _preferences?.getString('userDateEnd') ?? "";

  static Future setUserId(String id) async =>
      await _preferences?.setString('userId', id);

  static String getId() => _preferences?.getString('userId') ?? "";
}
