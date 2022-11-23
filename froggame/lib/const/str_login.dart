import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/animation.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';

class StrLogin {
  static final imageMain = "assets/pngwing.png";
  static final btnName = "Sign in with google";
  static final imageMain2 = "";
  static final imageMain3 = "";
  static final imageMain4 = "";
  static final imageMain5 = "";
  static final imageMain6 = "";
  static final lstText = ['Chào mừng bạn', 'đã đến với', 'Frog Quiz'];

  static List<AnimatedText> TEXT = [
    TEXT_ANIMATED(txt: lstText[0]),
    TEXT_ANIMATED(txt: lstText[1]),
    TEXT_ANIMATED(txt: lstText[2])
  ];

  static TEXT_ANIMATED(
      {required String txt, List<Color>? color, double? size}) {
    return ColorizeAnimatedText(
      txt,
      textStyle: F_lobster.copyWith(fontSize: size ?? 40),
      colors: color ?? colorizeColors,
    );
  }
}
