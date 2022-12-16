import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/animation.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';

class StrLogin {
  static const imageMain = "assets/pngwing.png";
  static const btnName = "Sign in with google";
  static const imageMain2 = "";
  static const imageMain3 = "";
  static const imageMain4 = "";
  static const imageMain5 = "";
  static const imageMain6 = "";
  static final lstText = ['Chào mừng bạn', 'đã đến với', 'Frog Quiz'];

  // ignore: non_constant_identifier_names
  static List<AnimatedText> TEXT = [
    TEXT_ANIMATED(txt: lstText[0]),
    TEXT_ANIMATED(txt: lstText[1]),
    TEXT_ANIMATED(txt: lstText[2])
  ];

  // ignore: non_constant_identifier_names
  static TEXT_ANIMATED(
      {required String txt, List<Color>? color, double? size}) {
    return ColorizeAnimatedText(
      txt,
      textStyle: F_lobster.copyWith(fontSize: size ?? 40),
      colors: color ?? colorizeColors,
    );
  }
}
