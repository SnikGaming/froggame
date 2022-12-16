import 'package:shared_preferences/shared_preferences.dart';

class PackgeSimplePreferences {
  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();
}
