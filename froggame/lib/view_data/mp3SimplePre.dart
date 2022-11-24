import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:froggame/view_data/setting_pref.dart';

class Mp3Simple {
  static AssetsAudioPlayer _play = AssetsAudioPlayer();
  static Future init() async {
    await _play.open(Audio('assets/baga.mp3'),
        autoStart: false, showNotification: true);
    await _play.play();
    await _play.setLoopMode(LoopMode.single);
  }

  static Future VolumeMP3() async {
    // if (SettingSimplePreferences.getSound() != null) {
    //   _play.setPitch(SettingSimplePreferences.getSound());
    //   _play.pitch.listen((event) {});
    // }
    // return;
    if (SettingSimplePreferences.getSound() != null) {
      await _play.setVolume(SettingSimplePreferences.getSound());
    }
  }
}
