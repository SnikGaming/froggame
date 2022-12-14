import 'package:flutter/material.dart';


class Hearts {
  // ignore: non_constant_identifier_names
  static List<String> Coins = ["10", "20", "30", "40", "50", "60", "100"];

  // ignore: non_constant_identifier_names
  static List<String> Heart = ["5", "10", "15", "20", "25", "30", "100"];

  static item(String coin, String heart) {
    return Column(
      children: [
        // ignore: todo
        //TODO :
        Column(
          children: [
            // Image.asset(
            //   "assets/coin.png",
            //   width: 50,
            //   height: 50,
            // ),
            const Text(
              '❤️',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Text('$heart ❤️',
                style: const TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(
              width: 2,
              height: 2,
            ),
            Text("$coin 🪙",
                //textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
