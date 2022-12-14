// ignore: unused_import
// ignore_for_file: non_constant_identifier_names

import 'package:froggame/view_data/setting_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static const _keyUsername = "username";
  static const _keyUserId = "userId";
  static const _keyUserPic = "userPic";
  static const _keyUserScore = "userScore";
  static const _keyUserHeart = "userHeart";
  static const _keyLogin = "statusUser";
  static const _keyEmail = "userEmail";
  static const _keyDTL = "userDTL";
  //!:
  static const _keyAvatar = "avatar";
  static const _name = "name";
  static const _ngaysinh = "ngaysinh";
  static const _tokenMessage = "tokenMessage";

  static const _keySLQues = "SL";

  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

  // //! Login tokenMessage
  static Future setTokenMessage({required String tokenMessage}) async =>
      await preferences!.setString(_tokenMessage, tokenMessage);
  static getTokenMessage() => preferences!.getString(_tokenMessage);
  static Future removeTokenMessage() async =>
      await preferences!.remove(_tokenMessage);
  // //! Login ngaysinh
  static Future setNgaySinh({required String age}) async =>
      await preferences!.setString(_ngaysinh, age);
  static getNgaySinh() => preferences!.getString(_ngaysinh);
  static Future removeNgaySinh() async => await preferences!.remove(_ngaysinh);
  // //! Login name
  static Future setName({required String name}) async =>
      await preferences!.setString(_name, name);
  static getName() => preferences!.get(_name);
  static Future removeName() async => await preferences!.remove(_name);
  // //! Login Avatar
  static Future setAvatar({required String avatar}) async =>
      await preferences!.setString(_keyAvatar, avatar);
  static getAvatar() => preferences!.get(_keyAvatar);
  static Future removeAvatar() async => await preferences!.remove(_keyAvatar);
  //?:
  // //! Login user
  static Future setSL({required int index}) async =>
      await preferences!.setInt(_keySLQues, index);
  static getSL() => preferences!.getInt(_keySLQues);
  static Future removeSL() async => await preferences!.remove(_keySLQues);
  //?:

// //! Login user
  static Future setLogin({required bool status}) async =>
      await preferences!.setBool(_keyLogin, status);
  static getUserLogin() => preferences!.getBool(_keyLogin);
  static Future removeUserLogin() async => await preferences!.remove(_keyLogin);

//! ID username
  static Future setUserId({required String id}) async =>
      await preferences!.setString(_keyUserId, id);
  static getUserId() => preferences!.getString(_keyUserId);

  static Future removeUserId() async => await preferences!.remove(_keyUserId);

  //! ID user Email
  static Future setUserEmail({required String email}) async =>
      await preferences!.setString(_keyEmail, email);
  static getUserEmail() => preferences!.getString(_keyEmail);

  static Future removeUserEmail() async => await preferences!.remove(_keyEmail);
//! Username
  static Future setUsername({required String username}) async =>
      await preferences!.setString(_keyUsername, username);
  static getUsername() => preferences!.getString(_keyUsername);
  static Future removeUsername() async =>
      await preferences!.remove(_keyUsername);

//! Pic
  static Future setUserPic({required String pic}) async =>
      await preferences!.setString(_keyUserPic, pic);
  static getUserPic() => preferences!.getString(_keyUserPic);
  static Future removeUserPic() async => await preferences!.remove(_keyUserPic);

//! Score username
  static Future setScore({required int score}) async =>
      await preferences!.setInt(_keyUserScore, score);
  static getScore() => preferences!.getInt(_keyUserScore);
  static Future removeUserScore() async =>
      await preferences!.remove(_keyUserScore);

  //! Heart username
  static Future setHeart({required int heart}) async =>
      await preferences!.setInt(_keyUserHeart, heart);
  static getHeart() => preferences!.getInt(_keyUserHeart);
  static Future removeUserHeart() async =>
      await preferences!.remove(_keyUserHeart);
  //! SLCD username
  static Future setSLCD({required int CauDung}) async =>
      await preferences!.setInt(_keyDTL, CauDung);
  static getSLCD() => preferences!.getInt(_keyDTL);
  static Future removeSLCD() async => await preferences!.remove(_keyDTL);
//! removeAll
  static Future removeAll() async {
    await removeUsername();
    await removeUserId();
    await removeUserPic();
    await removeUserHeart();
    await removeUserEmail();
    UserSimplePreferences.setUserId(id: "");
    await removeUserLogin();
    await removeUserScore();
    await SettingSimplePreferences.removeAll();
    await removeSL();
    await removeSLCD();
    await removeNgaySinh();
    await removeName();
    await removeName();
    await removeAvatar();
    await removeTokenMessage();
  }
}
