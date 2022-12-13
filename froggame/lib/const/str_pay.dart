import 'package:flutter/material.dart';

import 'colors.dart';

class Pay {
  // ignore: non_constant_identifier_names
  static List<String> MenhGia = ["22", "109", "219", "449", "1099", "2199"];

  // ignore: non_constant_identifier_names
  static List<String> Coins = ["12", "50", "220", "450", "1000", "2000"];

  static item(String coin, String menhgia) {
    return Column(
      children: [
        // ignore: todo
        //TODO :
        Column(
          children: [
            Image.asset(
              "assets/coin.png",
              width: 50,
              height: 50,
            ),
            Text(
              "$coin coin \n $menhgia.000đ",
              textAlign: TextAlign.center,
              style: const TextStyle(color: blue, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
