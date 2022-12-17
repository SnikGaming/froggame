import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/str_login.dart';
import 'package:froggame/view_data/login_method.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../const/colors.dart';
import '../../const/text_style.dart';

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
              // ignore: sort_child_properties_last
              child: Container(),
              flex: 1,
            ),
            //! Image game
            // Image.asset(StrLogin.imageMain),

            AnimatedCusScal(
                context: context,
                s: 1500,
                chil: Image.asset("assets/images/giphy1.webp", height: 500)),
            Flexible(
              // ignore: sort_child_properties_last
              child: Container(),
              flex: 1,
            ),
            // ignore: todo
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
            AnimatedCus(
                context: context,
                y: 80,
                chil: RoundedLoadingButton(
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
                        normalText(
                            text: StrLogin.btnName, size: 15, color: white),
                      ],
                    ))),
            Flexible(
              // ignore: sort_child_properties_last
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
