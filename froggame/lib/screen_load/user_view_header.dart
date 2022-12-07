import 'package:flutter/material.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../const/font_app.dart';

// ignore: non_constant_identifier_names
UserHeader({required double height}) {
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
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      UserSimplePreferences.getUserPic(),
                    ),
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            //? NAME
            Text(
              UserSimplePreferences.getUsername(),
              style: F_lobster.copyWith(fontSize: 20),
            )
          ],
        ),

        //! HEART && SCORE
        Row(
          children: [
            //?SCORE
            Text(
              "${UserSimplePreferences.getScore()} 🪙",
              style: F_permanent.copyWith(fontSize: 20),
            ),
            const SizedBox(
              width: 20,
            ),
            //?HEART
            Text(
              "${UserSimplePreferences.getHeart()} ❤️",
              style: F_permanent.copyWith(fontSize: 20),
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
