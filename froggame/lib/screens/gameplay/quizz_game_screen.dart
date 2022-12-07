// ignore_for_file: unnecessary_brace_in_string_interps, duplicate_ignore

import 'dart:async';

// ignore: unused_import
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';
// ignore: unused_import
import 'package:froggame/screen_load/view.dart';
// ignore: unused_import
import 'package:froggame/screens/winner/winner_screen.dart';
import 'package:froggame/view_data/package_method.dart';

import '../../const/colors.dart';
import '../../view_data/firestore_user.dart';
import '../../view_data/user_pre.dart';

// ignore: must_be_immutable
class QuizzGameScreen extends StatefulWidget {
  int idlv;
  QuizzGameScreen({super.key, required this.idlv});

  @override
  // ignore: no_logic_in_create_state
  State<QuizzGameScreen> createState() => _QuizzGameScreenState(idlv: idlv);
}

class _QuizzGameScreenState extends State<QuizzGameScreen> {
  int idlv;
  late Future questions;
  _QuizzGameScreenState({required this.idlv});

  // ignore: todo
  //TODO: Data
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    questions = FirebaseFirestore.instance
        .collection("questions")
        .where('idlv', isEqualTo: idlv)
        //   .orderBy('id', descending: true)
        .get();
    startTimer();
  }

// ignore: todo
//TODO: Dap an
  var lsAnswer = [];
  // ignore: todo
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
  int sec = 30;

  var isLoadAnswer = false;
// ignore: todo
//TODO: Game Over
  var isGameOver = false;
// ignore: todo
//TODO: Heart
  int heart = UserSimplePreferences.getHeart();
  int score = UserSimplePreferences.getScore();
  var img = UserSimplePreferences.getUserPic();
// ignore: todo
//TODO: Question
  int currenIndex = UserSimplePreferences.getSL();
  int number = 0;
  int val = -1;

// ignore: todo
//TODO: Functions
  // ignore: non_constant_identifier_names
  void _Them15s() {
    bool isHd = true;
    if (score >= 2 && isHd) {
      score = score - 2;
      sec += 15;
      isHd = false;
      UpdateHeart();
    } else {
      // ignore: avoid_print
      print("Khong du xu");
    }
  }

//Timestamp
  // ignore: non_constant_identifier_names
  void _HoiKhanGia() {
    //List<String> lsGoiY = [];
    // lsGoiY.add(lsAnswer[0]);
    // lsGoiY.add(lsAnswer[0]);
    // lsGoiY.add(lsAnswer[1]);
    // lsGoiY.add(lsAnswer[2]);
//${lsGoiY[new Random().nextInt(4)]}

    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
  }

  // ignore: non_constant_identifier_names
  void _Nextquestione() {
    bool isHd = true;

    if (score >= 4 && isHd) {
      score = score - 4;
      if (currenIndex < number) {
        currenIndex++;
      }
      PackageMethod.UpatePackage(currentIndex: currenIndex, index: idlv);
      UpdateHeart();
      isHd = false;
    } else {
      // ignore: avoid_print
      print("Khong du xu");
    }
  }

  // ignore: non_constant_identifier_names
  UpdateHeart() {
    if (heart > -1 && isGameOver == false) {
      FureStoreUser.addDataUser(heart: heart, score: score);

      setState(() {});
    }
  }

  startTimer() {
    sec = 15;
    if (heart > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!isGameOver) {
          if (currenIndex + 1 >= number && sec < 0) {
            timer.cancel();
            showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 167, 79, 225),
                      title: const Text("Thông báo"),
                      content: Text(
                          "Chúc mừng ${UserSimplePreferences.getUsername()} đã giành chiến thắng !!!\nNhấn Ok để hoàn thành các thử thách khác."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'welcome2', (route) => false);
                            },
                            child: const Text("Ok"))
                      ],
                    )));
          }
          setState(() {
            sec--;
            if (sec < 0) {
              currenIndex++;
              PackageMethod.UpatePackage(
                  currentIndex: currenIndex, index: idlv);

              heart--;
              sec = 15;
              setState(() {});
            }
          });
        } else {
          timer.cancel();
        }
      });
    } else {
      timer!.cancel();

      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 167, 79, 225),
                title: const Text("Thông báo"),
                content: Text(
                    "Chúc mừng ${UserSimplePreferences.getUsername()} đã giành chiến thắng !!!\nNhấn Ok để hoàn thành các thử thách khác."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'welcome2', (route) => false);
                      },
                      child: const Text("Ok"))
                ],
              )));
    }
  }

  // ignore: unused_element
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
                child: SizedBox(
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
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Align(
                            alignment: Alignment.center, child: Text("$sec")),
                      ),
                      //!: Score and heart
                      SizedBox(
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
                          // ignore: curly_braces_in_flow_control_structures
                          return Column(
                            children: [
                              SizedBox(
                                height: size.height * .05,
                                width: size.width,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
                                  child: Text(
                                    // ignore: unnecessary_brace_in_string_interps
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
                                  color:
                                      const Color.fromARGB(155, 130, 50, 221),
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
                              SizedBox(
                                height: size.height * .47,
                                width: size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: lsAnswer.length,
                                    itemBuilder: ((context, index) {
                                      // ignore: todo
                                      //TODO: Click Answer
                                      return GestureDetector(
                                        onTap: () {
                                          if (!isGameOver) {
                                            timer!.cancel();
                                            if (lsAnswer[index].toString() ==
                                                data[currenIndex]['a']) {
                                              lsColors[index] = Colors.green;
                                              // ignore: avoid_print
                                              print("dung");

                                              score++;
                                              UpdateHeart();
                                            } else {
                                              // ignore: avoid_print
                                              print("Sai");
                                              lsColors[index] = Colors.red;

                                              heart--;
                                              UpdateHeart();
                                            }
                                            setState(() {});
                                            if (currenIndex + 1 < number) {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000), () {
                                                //sec = 15;

                                                startTimer();
                                                currenIndex++;
                                                PackageMethod.UpatePackage(
                                                    currentIndex: currenIndex,
                                                    index: idlv);

                                                lsAnswer = [];
                                                isLoadAnswer = false;
                                                resetColor();

                                                setState(() {});
                                              });
                                            } else {
                                              isGameOver = true;
                                              // ignore: avoid_print
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
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                167,
                                                                79,
                                                                225),
                                                        title: const Text(
                                                            "Thông báo"),
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
                                                              child: const Text(
                                                                  "Ok"))
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
                        else {
                          return Container();
                        }
                      }
                      return const Center(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator()));
                    })),
              ),
//!: BTN helps
              SizedBox(
                width: size.width,
                height: size.height * .12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: todo
                    //TODO: NextQuestion
                    GestureDetector(
                      onTap: _HoiKhanGia,
                      child: btnHelps(size: size, txt: "Gợi ý"),
                    ),
                    // ignore: todo
                    //TODO: Add 15s

                    GestureDetector(
                      onTap: _Them15s,
                      child: btnHelps(size: size, txt: "+15s"),
                    ),
                    // ignore: todo
                    //TODO: 50/50
                    GestureDetector(
                      onTap: _Nextquestione,
                      child: btnHelps(size: size, txt: "NextQuestion"),
                    ),
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

btnHelps({required Size size, required String txt}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 60,
      width: size.width * .3,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 13),
              color: Colors.black,
              blurRadius: 20,
            )
          ]),
      child: Align(
        child: Text(txt),
      ),
    ),
  );
}
