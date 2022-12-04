import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/screens/winner/winner_screen.dart';

import '../../const/colors.dart';
import '../../view_data/firestore_user.dart';
import '../../view_data/user_pre.dart';

class QuizzGameScreen extends StatefulWidget {
  int idlv;
  QuizzGameScreen({super.key, required this.idlv});

  @override
  State<QuizzGameScreen> createState() => _QuizzGameScreenState(idlv: idlv);
}

class _QuizzGameScreenState extends State<QuizzGameScreen> {
  int idlv;
  late Future questions;
  _QuizzGameScreenState({required this.idlv});

  //TODO: Data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questions = FirebaseFirestore.instance
        .collection("questions")
        .where('idlv', isEqualTo: idlv)
        //   .orderBy('id', descending: true)
        .get();
    startTimer();
  }

//TODO: Dap an
  var lsAnswer = [];
  //TODO: Colors answer
  static Color answerCls = Colors.yellowAccent;
  List<Color> lsColors = [
    answerCls,
    answerCls,
    answerCls,
    answerCls,
  ];

//!: Values
  Timer? timer;
  int sec = 15;

  var isLoadAnswer = false;
//TODO: Game Over
  var isGameOver = false;
//TODO: Heart
  int heart = UserSimplePreferences.getHeart();
  int score = UserSimplePreferences.getScore();
  var img = UserSimplePreferences.getUserPic();
//TODO: Question
  var currenIndex = 0;
  int number = 0;
  int val = -1;

//TODO: Functions
  UpdateHeart() {
    if (heart > -1 && isGameOver == false) {
      FureStoreUser.addDataUser(heart: heart, score: score);

      setState(() {});
    }
  }

  startTimer() {
    sec = 15;

    if (heart > 0) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!isGameOver) {
          if (currenIndex + 1 >= number && sec < 0) {
            timer.cancel();

            showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      backgroundColor: Color.fromARGB(255, 167, 79, 225),
                      title: Text("Thông báo"),
                      content: Text(
                          "Chúc mừng ${UserSimplePreferences.getUsername()} đã giành chiến thắng !!!\nNhấn Ok để hoàn thành các thử thách khác."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'welcome2', (route) => false);
                            },
                            child: Text("Ok"))
                      ],
                    )));
          }

          setState(() {
            sec--;

            if (isGameOver) {
              timer.cancel();
            }
            if (sec < 0) {
              currenIndex++;

              heart--;
              sec = 15;
              setState(() {});
            }
          });
        }
      });
    } else {
      timer!.cancel();

      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                backgroundColor: Color.fromARGB(255, 167, 79, 225),
                title: Text("Thông báo"),
                content: Text(
                    "Chúc mừng ${UserSimplePreferences.getUsername()} đã giành chiến thắng !!!\nNhấn Ok để hoàn thành các thử thách khác."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'welcome2', (route) => false);
                      },
                      child: Text("Ok"))
                ],
              )));
    }
  }

  _answerQuestion() {}

  addAnswe(data) {
    if (currenIndex < number) {
      if (isLoadAnswer == false) {
        lsAnswer.add(data[currenIndex]['a']);
        lsAnswer.add(data[currenIndex]['b']);
        lsAnswer.add(data[currenIndex]['c']);
        lsAnswer.add(data[currenIndex]['d']);
        lsAnswer.shuffle();
        isLoadAnswer = true;
      }
    } else {}
  }

  resetColor() {
    lsColors = [
      answerCls,
      answerCls,
      answerCls,
      answerCls,
    ];
  }

  updateScore() {}

  updateHeart() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(gradient: background),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!: User
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  height: size.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //!: User Img
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage(img))),
                      ),
                      //!: Timer,
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Align(
                            alignment: Alignment.center, child: Text("${sec}")),
                      ),
                      //!: Score and heart
                      Container(
                        width: 100,
                        child: Text(
                          "${score} 🪙\t\t${heart} ❤️",
                          style: F_pacifico.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //!: Question and answer
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: size.height * .73,
                child: FutureBuilder(
                    future: questions,
                    builder: ((context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data.docs;

                        number = data.length;
                        addAnswe(data);
                        if (currenIndex < number)
                          return Column(
                            children: [
                              Container(
                                height: size.height * .05,
                                width: size.width,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Câu hỏi : ${currenIndex + 1}/${number}",
                                    style: F_pacifico.copyWith(
                                        color: blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * .2,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(155, 130, 50, 221),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${data[currenIndex]['name']}",
                                    style: F_pacifico.copyWith(
                                        color: blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                height: size.height * .47,
                                width: size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: lsAnswer.length,
                                    itemBuilder: ((context, index) {
                                      //TODO: Click Answer
                                      return GestureDetector(
                                        onTap: () {
                                          if (!isGameOver) {
                                            timer!.cancel();
                                            if (lsAnswer[index].toString() ==
                                                data[currenIndex]['a']) {
                                              lsColors[index] = Colors.green;
                                              print("dung");

                                              score++;
                                              UpdateHeart();
                                            } else {
                                              print("Sai");
                                              lsColors[index] = Colors.red;
                                              UpdateHeart();

                                              heart--;
                                            }
                                            setState(() {});
                                            if (currenIndex + 1 < number) {
                                              Future.delayed(
                                                  Duration(milliseconds: 1000),
                                                  () {
                                                //sec = 15;

                                                startTimer();
                                                currenIndex++;
                                                lsAnswer = [];
                                                isLoadAnswer = false;
                                                resetColor();

                                                setState(() {});
                                              });
                                            } else {
                                              isGameOver = true;
                                              print(
                                                  "---------------------------------->Hoan thanh");

                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (_) =>
                                              //             WinScreen()));

                                              showDialog(
                                                  context: context,
                                                  builder: ((context) =>
                                                      AlertDialog(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                167, 79, 225),
                                                        title:
                                                            Text("Thông báo"),
                                                        content: Text(
                                                            "Chúc mừng ${UserSimplePreferences.getUsername()} đã giành chiến thắng !!!\nNhấn Ok để hoàn thành các thử thách khác."),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pushNamedAndRemoveUntil(
                                                                    context,
                                                                    'welcome2',
                                                                    (route) =>
                                                                        false);
                                                              },
                                                              child: Text("Ok"))
                                                        ],
                                                      )));
                                            }
                                          } else {}
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            height: size.height * .09,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: lsColors[index],
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${lsAnswer[index]}",
                                                style: F_pacifico.copyWith(
                                                    color: Colors.purple,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                              )
                            ],
                          );
                        else
                          return Container();
                      }
                      return Center(
                          child: Container(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator()));
                    })),
              ),
//!: BTN helps
              Container(
                width: size.width,
                height: size.height * .12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO: NextQuestion
                    btnHelps(size: size),
                    //TODO: Add 15s
                    btnHelps(size: size),

                    //TODO: 50/50
                    btnHelps(size: size)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

btnHelps({required Size size}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 60,
      width: size.width * .3,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 13),
              color: Colors.black,
              blurRadius: 20,
            )
          ]),
      child: Align(
        child: Text("+15s"),
      ),
    ),
  );
}
