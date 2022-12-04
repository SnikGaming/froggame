import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:froggame/const/values.dart';
import 'package:froggame/view_data/setting_pref.dart';

class Mp3Simple {
  static AssetsAudioPlayer _play = AssetsAudioPlayer();
  static Future init() async {
    await _play.open(Audio(mp3), autoStart: false, showNotification: false);
    VolumeMP3();

    await _play.play();
    await _play.setLoopMode(LoopMode.single);
  }

  static Future VolumeMP3() async {
    if (SettingSimplePreferences.getSound() != null) {
      double vol = SettingSimplePreferences.getSound() / 100;
      await _play.setVolume(vol);
    }
  }
}
