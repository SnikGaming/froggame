import 'package:flutter/material.dart';
import 'package:froggame/const/text_style.dart';
import 'package:froggame/screens/gameplay/options_screen.dart';
import '../../const/colors.dart';

class PaytoWin extends StatefulWidget {
  const PaytoWin({super.key});

  @override
  State<PaytoWin> createState() => _PaytoWinState();
}

class _PaytoWinState extends State<PaytoWin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bg1, bg2],
          ),
        ),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/coin.png",
                    width: 50,
                    height: 50,
                  ),
                  headingText(
                      text: "20.000đ \n 20 coin", size: 18, color: blue),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/coin.png",
                    width: 50,
                    height: 50,
                  ),
                  headingText(
                      text: "50.000đ \n 50 coin", size: 18, color: blue),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/coin.png",
                    width: 50,
                    height: 50,
                  ),
                  headingText(
                      text: "100.000đ \n 100 coin", size: 18, color: blue),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/coin.png",
                    width: 50,
                    height: 50,
                  ),
                  headingText(
                      text: "200.000đ \n 200 coin", size: 18, color: blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar appbarWidget() {
  return AppBar(
    title: Text('Hỗ trợ'),
    elevation: 0,
    backgroundColor: bg1,
  );
}
