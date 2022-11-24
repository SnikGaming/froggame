import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_setting.dart';
import 'package:froggame/view_data/mp3SimplePre.dart';
import 'package:froggame/view_data/setting_pref.dart';
import 'package:slider_controller/slider_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(gradient: background),
          child: Column(
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              //TODO : Am luong
              // BalloonSlider(
              //     value: 0.5,
              //     ropeLength: 55,
              //     showRope: true,
              //     onChangeStart: (val) {},
              //     onChanged: (val) {},
              //     onChangeEnd: (val) {},
              //     color: Colors.indigo)

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      StrSetting.amluong,
                      style: F_lobster.copyWith(fontSize: 30, color: white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width * .55,
                    child: SliderController(
                      value: SettingSimplePreferences.getSound() ?? 1.0,
                      onChanged: (value) {
                        SettingSimplePreferences.setSound(val: value / 100);
                        Mp3Simple.VolumeMP3();
                        print(
                            'slider value : ${SettingSimplePreferences.getSound()}');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      StrSetting.hieuung,
                      style: F_lobster.copyWith(fontSize: 30, color: white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width * .55,
                    child: SliderController(
                      value: SettingSimplePreferences.getEffect() ?? 1.0,
                      onChanged: (value) {
                        SettingSimplePreferences.setEffect(val: value);
                        print('slider value : ${value / 10}');
                      },
                    ),
                  ),
                ],
              ),

              //TODO : Run
              Flexible(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
