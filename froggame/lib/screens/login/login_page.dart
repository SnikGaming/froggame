import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/const/str_login.dart';
import 'package:froggame/view_data/login_method.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../const/colors.dart';
import '../../const/text_style.dart';
import '../../screen_load/view.dart';
import 'dart:math' as pi;

class SiginPage extends StatefulWidget {
  const SiginPage({super.key});
  @override
  State<SiginPage> createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  CarouselController buttonCarouselController = CarouselController();

  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(gradient: background),
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            //! Image game
            // Image.asset(StrLogin.imageMain),
            Image.asset("assets/images/giphy1.webp"),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            // //TODO :Slider
            // CarouselSlider(
            //     items: const [View()],
            //     options: CarouselOptions(
            //       //height: 150,
            //       aspectRatio: 16 / 9,
            //       viewportFraction: 0.8,
            //       initialPage: 0,
            //       enableInfiniteScroll: true,
            //       reverse: false,
            //       autoPlay: true,
            //       autoPlayInterval: const Duration(seconds: 3),
            //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
            //       autoPlayCurve: Curves.fastOutSlowIn,
            //       enlargeCenterPage: true,
            //       scrollDirection: Axis.horizontal,
            //     )),
            const SizedBox(
              height: 40,
            ),
            //! Text game
            AnimatedTextKit(
              animatedTexts: StrLogin.TEXT,
              isRepeatingAnimation: true,
            ),
            const Spacer(),
            //! Button
            RoundedLoadingButton(
                controller: googleController,
                successColor: red,
                width: MediaQuery.of(context).size.width * .8,
                elevation: 0,
                borderRadius: 25,
                color: red,
                onPressed: () async {
                  try {
                    AuthMethod().googleSignInMethod(context);
                  } catch (e) {
                    // return;
                    print("loi");
                  }
                },
                child: Wrap(
                  children: [
                    const Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    normalText(text: StrLogin.btnName, size: 15, color: white),
                  ],
                )),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
