// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                // ignore: sort_child_properties_last
                child: Container(),
                flex: 1,
              ),
              // ignore: todo
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
                  Text(
                    StrSetting.amluong,
                    style: F_lobster.copyWith(fontSize: 30, color: white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * .55,
                    child: SliderController(
                      value: SettingSimplePreferences.getSound() ?? 100,
                      onChanged: (value) {
                        SettingSimplePreferences.setSound(val: value);
                        Mp3Simple.VolumeMP3();
                        // ignore: avoid_print
                        //print(
                        //'slider value : ${SettingSimplePreferences.getSound() / 100}');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       StrSetting.hieuung,
              //       style: F_lobster.copyWith(fontSize: 30, color: white),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     // ignore: sized_box_for_whitespace
              //     Container(
              //       width: size.width * .55,
              //       child: SliderController(
              //         value: SettingSimplePreferences.getEffect() ?? 100,
              //         onChanged: (value) {
              //           SettingSimplePreferences.setEffect(val: value);
              //           // ignore: avoid_print
              //           //print('slider value : ${value / 10}');
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              // ignore: todo
              //TODO : Run
              Flexible(
                // ignore: sort_child_properties_last
                child: Container(),
                flex: 1,
              ),
              GestureDetector(
                onTap: () async {
                  int id = 30;
                  String name = "Hoàng Sa - Trường Sa của nước nào?";
                  String a = "Việt Nam";
                  String b = "Việt Nam";
                  String c = "Việt Nam";
                  String d = "Việt Nam";
//!:
                  int idlv = 4;
                  String table = "questions";
                  final data = FirebaseFirestore.instance
                      .collection(table)
                      .doc("${id}${idlv}");

                  await data.set({
                    "id": id,
                    "idlv": idlv,
                    "name": name,
                    "a": a,
                    "b": b,
                    "c": c,
                    "d": d
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
