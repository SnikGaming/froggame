import 'package:flutter/material.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../const/colors.dart';
import '../const/font_app.dart';

// ignore: non_constant_identifier_names
UserHeader({required double height, required BuildContext context}) {
  // ignore: sized_box_for_whitespace
  return Container(
    height: height,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! IMG & NAME
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            //? IMG
            AnimatedCus(
              s: 1000,
              context: context,
              x: -100,
              curve: Curves.elasticInOut,
              chil: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.pink]),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(UserSimplePreferences.getUserPic())),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //? NAME
            AnimatedCusScal(
                context: context,
                curve: Curves.fastLinearToSlowEaseIn,
                s: 1200,
                chil: Text(
                  UserSimplePreferences.getUsername(),
                  style: F_lobster.copyWith(
                      fontSize: 24,
                      color: const Color.fromARGB(255, 102, 17, 205)),
                ))
          ],
        ),

        //! HEART && SCORE
        Row(
          children: [
            //?SCORE
            Text(
              "${UserSimplePreferences.getScore()} 🪙",
              style: F_lobster.copyWith(fontSize: 20, color: white),
            ),
            const SizedBox(
              width: 20,
            ),
            //?HEART
            Text(
              "${UserSimplePreferences.getHeart()} ❤️",
              style: F_lobster.copyWith(fontSize: 20, color: white),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    ),
  );
}
