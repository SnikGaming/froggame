import 'package:flutter/material.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/screens/battle/battle_vs_screen.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  bool isStart = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 62, 10, 117),
                Color.fromARGB(228, 233, 30, 98)
              ],
            ),
          ),
          child:

              /// [Stack More Detail](https://api.flutter.dev/flutter/widgets/Stack-class.html)
              Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: <Widget>[
              Visibility(
                visible: isStart,
                child: Image.network(
                    "https://media.giphy.com/media/LXnF8Zzto0AwKtoO8B/giphy.gif"),
              ),
              Visibility(
                visible: !isStart,
                child: Image.network(
                    "https://media.giphy.com/media/WNio8wQHUacsER1k0Q/giphy.gif"),
              ),

              //!: BTN
              Positioned(
                bottom: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    isStart = !isStart;
                    setState(() {});
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      if (isStart) {
                        nextScreen(context, const BattleVsScreen());
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 110,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
