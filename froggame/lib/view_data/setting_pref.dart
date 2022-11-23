import 'package:shared_preferences/shared_preferences.dart';

class SettingSimplePreferences {
  static const _keySound = "sound";

  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();
// //! Login user
  static Future setSound({required double val}) async =>
      await preferences!.setDouble(_keySound, val);
  static getSound() => preferences!.getDouble(_keySound);
  static Future removSound() async => await preferences!.remove(_keySound);

//! removeAll
  static Future removeAll() async {
    await removSound();
  }
}
