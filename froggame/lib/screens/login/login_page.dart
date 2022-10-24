import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../const/colors.dart';
import '../../const/next_screen.dart';
import '../../const/text_style.dart';
import '../../const/values.dart';
import '../gameplay/quizz_home.dart';

class SiginPage extends StatefulWidget {
  const SiginPage({super.key});

  @override
  State<SiginPage> createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bg1, bg2])),
        child: Column(
          children: [
            BOX(height: 120),
            Image.asset("assets/pngwing.png"),
            headingText(text: "QUIZZ FROG", size: 42, color: white),
            Spacer(),
            RoundedLoadingButton(
                controller: googleController,
                successColor: Colors.red,
                width: MediaQuery.of(context).size.width * .8,
                elevation: 0,
                borderRadius: 25,
                color: red,
                onPressed: () {
                  nextScreen(context, QuizzHome());
                },
                child: Wrap(
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    normalText(
                        text: "Sign in with google", size: 15, color: white),
                  ],
                )),
            BOX(height: 10),
            RoundedLoadingButton(
                controller: googleController,
                successColor: Colors.blue,
                width: MediaQuery.of(context).size.width * .8,
                elevation: 0,
                borderRadius: 25,
                color: blue,
                onPressed: () {
                  nextScreen(context, QuizzHome());
                },
                child: Wrap(
                  children: [
                    Icon(
                      FontAwesomeIcons.facebook,
                      size: 20,
                      color: white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    normalText(
                        text: "Sign in with Facebook", size: 15, color: white),
                  ],
                )),
            BOX(height: 20)
          ],
        ),
      ),
    );
  }
}
