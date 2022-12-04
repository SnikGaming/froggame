import 'package:flutter/material.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../const/font_app.dart';

UserHeader({required double height}) {
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
            Container(
              child: Text(
                UserSimplePreferences.getUsername(),
                style: F_lobster.copyWith(fontSize: 20),
              ),
            )
          ],
        ),

        //! HEART && SCORE
        Row(
          children: [
            //?SCORE
            Container(
              child: Text(
                "${UserSimplePreferences.getScore()} 🪙",
                style: F_permanent.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            //?HEART
            Container(
              child: Text(
                "${UserSimplePreferences.getHeart()} ❤️",
                style: F_permanent.copyWith(fontSize: 20),
              ),
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
