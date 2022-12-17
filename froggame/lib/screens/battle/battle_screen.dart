import 'dart:math';

import 'package:flutter/material.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/screens/battle/battle_vs_screen.dart';
import 'package:froggame/view_data/user_pre.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  bool isStart = false;
  bool isLsbanbe = false;
  String idPhong =
      "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${Random().nextInt(1000)}";
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
                child: Image.asset("assets/vs.webp"),
              ),
              Visibility(
                visible: !isStart,
                child: Image.asset("assets/vs1.webp"),
              ),

              //!: BTN
              Positioned(
                bottom: 20,
                left: 20,
                child: AnimatedCus(
                  context: context,
                  curve: Curves.easeInToLinear,
                  x: -50,
                  y: 90,
                  s: 700,
                  chil: Visibility(
                    visible: !isStart,
                    child: GestureDetector(
                      onTap: () {
                        isStart = !isStart;
                        setState(() {});
                        Future.delayed(const Duration(milliseconds: 900), () {
                          if (isStart) {
                            nextScreen(context, const BattleVsScreen());
                          }
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/button/btn_1/9.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Text("Start"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //!: VS1
              Positioned(
                  top: 40,
                  left: 40,
                  child: AnimatedCus(
                    s: 700,
                    x: -160,
                    context: context,
                    chil: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.amber,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: UserSimplePreferences.getAvatar() == ""
                              ? DecorationImage(
                                  image: NetworkImage(
                                    UserSimplePreferences.getUserPic(),
                                  ),
                                )
                              : DecorationImage(
                                  image: AssetImage(
                                    UserSimplePreferences.getAvatar(),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  )),
              //!: ID
              Positioned(
                top: 40,
                right: 0,
                child: AnimatedCus(
                  s: 700,
                  context: context,
                  y: -70,
                  curve: Curves.elasticInOut,
                  chil: Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      idPhong,
                      style: F_pacifico.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              //!: VS2
              Positioned(
                  bottom: 40,
                  right: 40,
                  child: AnimatedCus(
                    s: 700,
                    x: 160,
                    context: context,
                    chil: SizedBox(
                      height: 280,
                      width: 300,
                      child: Stack(
                        children: [
                          // ignore: todo
                          //TODO: USER
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                isLsbanbe = !isLsbanbe;
                                setState(() {});
                              },
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.amber,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: UserSimplePreferences.getAvatar() ==
                                            ""
                                        ? DecorationImage(
                                            image: NetworkImage(
                                              UserSimplePreferences
                                                  .getUserPic(),
                                            ),
                                          )
                                        : DecorationImage(
                                            image: AssetImage(
                                              UserSimplePreferences.getAvatar(),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ignore: todo
                          //TODO: LIST USER
                          Visibility(
                            visible: isLsbanbe,
                            child: Container(
                              width: 300,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
