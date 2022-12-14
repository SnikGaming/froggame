import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';

// ignore: must_be_immutable
class ViewData extends StatelessWidget {
  String? txt;
  ViewData({super.key, this.txt});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: lstColor[Random().nextInt(lstColor.length)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              assetEff[Random().nextInt(assetEff.length)],
              height: size.height * .2,
            ),
          ),
          Positioned(
            right: 10,
            child: Image.asset(
              // ignore: unnecessary_new
              assetEff[new Random().nextInt(assetEff.length)],
              height: size.height * .2,
            ),
          ),
          Positioned(
            child: Image.asset(
              assetImg[Random().nextInt(assetImg.length)],
              height: size.height * .15,
            ),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              child: DefaultTextStyle(
                style: F_pacifico.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w500),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(txt!),
                  ],
                  isRepeatingAnimation: true,
                ),
              )),
        ],
      ),
    );
  }
}

class Data {}

final lstColor = [
  const Color.fromARGB(146, 202, 165, 54),
  const Color.fromARGB(135, 41, 173, 129),
  const Color.fromARGB(133, 33, 149, 243),
  const Color.fromARGB(129, 55, 187, 127),
  const Color.fromARGB(131, 69, 55, 179),
  const Color.fromARGB(121, 186, 43, 177),
  const Color.fromARGB(129, 134, 56, 230)
];
final assetImg = [
  "assets/images/naoan.webp",
  "assets/images/tiepthu.webp",
  "assets/images/hoa.webp",
  "assets/images/gv.webp",
  'assets/images/take.webp'
];
final assetEff = [
  "assets/images/star1.webp",
  "assets/images/star2.webp",
  "assets/images/star3.webp",
  "assets/images/star4.webp",
  "assets/images/star5.webp",
];

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lstColor[Random().nextInt(lstColor.length)],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(17),
      ),
    );
  }
}
