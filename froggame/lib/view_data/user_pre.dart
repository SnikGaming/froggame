import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static const _keyUsername = "username";
  static const _keyUserId = "userId";
  static const _keyUserPic = "userPic";
  // static const _keyLogin = "statusUser";

  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();
// //! Login user
//   static Future setLogin({required bool status}) async =>
//       await preferences!.setBool(_keyLogin, status);
//   static getUserLogin() => preferences!.getBool(_keyLogin);

//! ID username
  static Future setUserId({required String id}) async =>
      await preferences!.setString(_keyUserId, id);
  static getUserId() => preferences!.getString(_keyUserId);

  static Future removeUserId() async => await preferences!.remove(_keyUserId);
//! Username
  static Future setUsername(String username) async =>
      await preferences!.setString(_keyUsername, username);
  static getUsername() => preferences!.getString(_keyUsername);
  static Future removeUsername() async =>
      await preferences!.remove(_keyUsername);

//! Pic
  static Future setUserPic({required String pic}) async =>
      await preferences!.setString(_keyUserPic, pic);
  static getUserPic() => preferences!.getString(_keyUserPic);
  static Future removeUserPic() async => await preferences!.remove(_keyUserPic);

//! removeAll
  static Future removeAll() async {
    // await setLogin(status: false);
    await removeUsername();
    await removeUserId();
    await removeUserPic();
  }
}
