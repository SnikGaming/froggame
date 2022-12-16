import 'package:shared_preferences/shared_preferences.dart';

class SettingSimplePreferences {
  static const _keySound = "sound";
  static const _keyEffect = "effect";

  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();
// //! Sound
  static Future setSound({required double val}) async =>
      await preferences!.setDouble(_keySound, val);
  static getSound() => preferences!.getDouble(_keySound);
  static Future removSound() async => await preferences!.remove(_keySound);

  // //! Effect
  static Future setEffect({required double val}) async =>
      await preferences!.setDouble(_keyEffect, val);
  static getEffect() => preferences!.getDouble(_keyEffect);
  static Future removEffect() async => await preferences!.remove(_keyEffect);

//! removeAll
  static Future removeAll() async {
    await removSound();
    await removEffect();
  }
}
