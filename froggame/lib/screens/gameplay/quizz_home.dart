import 'package:flutter/material.dart';
import 'package:froggame/screens/gameplay/quizz_screen.dart';
import '../../const/colors.dart';

import '../../const/next_screen.dart';
import '../../const/text_style.dart';
import '../../const/values.dart';

class QuizzHome extends StatelessWidget {
  const QuizzHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bg1, bg2])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Img

            Image.asset(
              "assets/giphy.webp",
            ),
            // Image.network(
            //   frog_main1,
            // ),

            // const SizedBox(
            //   height: 10,
            // )
            //

            normalText(
                text: "Welcome to our game!!! 🐸", color: lightgrey, size: 18),
            Row(
              children: [
                Image.asset(
                  frog_icon,
                  height: 60,
                ),
                headingText(text: "FROG QUIZZ", size: 32, color: Colors.white)
              ],
            ),
            normalText(text: ""), const Spacer(),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shadowColor: blue,
                      minimumSize: Size(240, 40),
                      side: BorderSide(width: 2, color: blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      nextScreen(context, QuizzScreen());
                    },
                    child:
                        headingText(text: "Continue", size: 18, color: blue)),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
