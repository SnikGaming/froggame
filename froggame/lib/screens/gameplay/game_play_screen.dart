// ignore_for_file: unnecessary_brace_in_string_interps, duplicate_ignore, non_constant_identifier_names

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
import 'package:quickalert/quickalert.dart';

import '../../const/colors.dart';
import '../../view_data/firesore_detailpack.dart';
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
  String name = UserSimplePreferences.getName() == ""
      ? UserSimplePreferences.getUsername()
      : UserSimplePreferences.getName();
  String tOrf = "";
  int idlv;
  late Future questions;
  static int defTimer = 30;
  late int valueCauDung;

  CauDung() async {
    await FirebaseFirestore.instance
        .collection("packageQuestions")
        .where('idgoi',
            isEqualTo: "${UserSimplePreferences.getUserId()}${idlv}")
        .get()
        .then((value) {
      for (var a in value.docs) {
        valueCauDung = a.data()['cautldung'];
      }
    });
  }

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
    CauDung();
  }

// ignore: todo
//TODO: Dap an
  var lsAnswer = [];
  var lsGoiY = [];
  // ignore: todo
  //TODO: Colors answer
  static Color answerCls = const Color.fromARGB(255, 45, 25, 21);
  List<Color> lsColors = [
    answerCls,
    answerCls,
    answerCls,
    answerCls,
  ];

//!: Values
  Timer? timer;
  static int sec = 0;

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
  int currenIndex = UserSimplePreferences.getSL() ?? 0;
  int Ctrl = UserSimplePreferences.getSLCD() ?? 0;
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
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("???? th??m 15s th??nh c??ng...!")));
      isHd = false;
      UpdateHeart();
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("B???n kh??ng ????? 2 xu ????? th???c hi???n thao t??c n??y...")));
    }
  }

//Timestamp
  // ignore: non_constant_identifier_names
  void _HoiKhanGia() {
//${lsGoiY[new Random().nextInt(4)]}

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("${lsGoiY[new Random().nextInt(lsGoiY.length)]}")));
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: "${lsGoiY[Random().nextInt(lsGoiY.length)]}",
    );
  }

  // ignore: non_constant_identifier_names
  _Nextquestione() {
    bool isHd = true;
    if (score >= 4 && isHd) {
      timer!.cancel();

      score = score - 4;
      if (currenIndex + 1 < number) {
        currenIndex++;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("B???n ???? ???????c chuy???n sang c??u m???i...")));
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: ((context) => AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 167, 79, 225),
                  title: const Text("Th??ng b??o"),
                  content: Text(
                      "Ch??c m???ng $name ???? ho??n th??nh ${currenIndex + 1}/${number}\nS??? c??u ????ng l?? ${valueCauDung} !!!\nNh???n Ok ????? ho??n th??nh c??c th??? th??ch kh??c."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'welcome2', (route) => false);
                        },
                        child: const Text("Ok",
                            style: TextStyle(color: Colors.white)))
                  ],
                )));
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
              context, 'welcome2', (route) => false);
        });
      }
      PackageMethod.UpatePackage(
          currentIndex: currenIndex, index: idlv, Ctrl: Ctrl);
      sec = 15;
      lsAnswer = [];
      isLoadAnswer = false;
      startTimer();
      UpdateHeart();
      setState(() {});
      isHd = false;
    } else {
      // ignore: avoid_print
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("B???n kh??ng ????? 4 xu ????? th???c hi???n thao t??c n??y...")));
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
    sec = defTimer;
    if (heart > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!isGameOver) {
          setState(() {
            sec--;
            if (sec < 0) {
              heart--;
              UpdateHeart();
              if (heart < 1) {
                timer.cancel();
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: ((context) => AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 167, 79, 225),
                          title: const Text("Th??ng b??o"),
                          content: Text(
                              "Ch??c m???ng $name ???? ho??n th??nh ${currenIndex + 1}/$number !!!\nS??? c??u ????ng l?? ${valueCauDung} ${heart > 0 ? 'Nh???n Ok ????? ho??n th??nh c??c th??? th??ch kh??c.' : 'Vui l??ng mua l?????t ????? ???????c ti???p t???c.'}"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, 'welcome2', (route) => false);
                                },
                                child: const Text("Ok",
                                    style: TextStyle(color: Colors.white)))
                          ],
                        )));
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'welcome2', (route) => false);
                });
              } else {
                currenIndex++;
                lsAnswer = [];
                isLoadAnswer = false;

                PackageMethod.UpatePackage(
                    currentIndex: currenIndex, index: idlv, Ctrl: Ctrl);
              }

              if (currenIndex >= 30) {
                timer.cancel();
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: ((context) => AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 167, 79, 225),
                          title: const Text(
                            "Th??ng b??o",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: white,
                                fontSize: 24),
                          ),
                          content: Text(
                              "Ch??c m???ng $name ???? ho??n th??nh l??nh v???c n??y !!!\nNh???n Ok ????? ho??n th??nh c??c th??? th??ch kh??c."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, 'welcome2', (route) => false);
                                },
                                child: const Text("Ok",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))))
                          ],
                        )));
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'welcome2', (route) => false);
                });
              }

              sec = defTimer;
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
          barrierDismissible: false,
          context: context,
          builder: ((context) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 167, 79, 225),
                title: const Text("Th??ng b??o"),
                content: Text(
                    "Ch??c m???ng $name ???? ho??n th??nh ${currenIndex + 1}/$number !!!\nS??? c??u ????ng l?? ${valueCauDung} ${heart > 0 ? 'Nh???n Ok ????? ho??n th??nh c??c th??? th??ch kh??c.' : 'Vui l??ng mua l?????t ????? ???????c ti???p t???c.'}"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'welcome2', (route) => false);
                      },
                      child: const Text("Ok",
                          style: TextStyle(color: Colors.white)))
                ],
              )));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, 'welcome2', (route) => false);
      });
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

        lsGoiY.add(lsAnswer[0]);
        lsGoiY.add(lsAnswer[0]);
        lsGoiY.add(lsAnswer[0]);
        lsGoiY.add(lsAnswer[0]);
        lsGoiY.add(lsAnswer[0]);
        lsGoiY.add(lsAnswer[0]);
        lsGoiY = lsAnswer;
      }
    }
  }

  resetColor() {
    lsColors = [
      answerCls,
      answerCls,
      answerCls,
      answerCls,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
              barrierDismissible: false,
              context: context,
              builder: ((context) => AlertDialog(
                    backgroundColor: Colors.green,
                    title: const Text("Th??ng b??o",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32)),
                    content: const Text("B???n c?? mu???n tho??t kh???i ????y..",
                        style: TextStyle(color: Colors.white)),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Kh??ng",
                              style: TextStyle(color: Colors.white))),
                      TextButton(
                          onPressed: () {
                            timer!.cancel();
                            currenIndex++;
                            heart--;
                            PackageMethod.UpatePackage(
                                currentIndex: currenIndex,
                                index: idlv,
                                Ctrl: Ctrl);
                            UpdateHeart();
                            isGameOver = true;
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Tho??t",
                              style: TextStyle(color: Colors.white))),
                    ],
                  )));

          if (value != null) {
            setState(() {});

            return Future.value(value);
          } else {
            return Future.value(false);
          }
        },
        child: SafeArea(
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
                        GestureDetector(
                          onTap: () {
                            timer!.cancel();
                            currenIndex++;
                            heart--;
                            PackageMethod.UpatePackage(
                                currentIndex: currenIndex,
                                index: idlv,
                                Ctrl: Ctrl);
                            UpdateHeart();
                            isGameOver = true;
                            Navigator.pushNamedAndRemoveUntil(
                                context, 'welcome2', (route) => false);
                            //Navigator.of(context).pop();
                          },
                          child: const SizedBox(
                            height: 60,
                            width: 60,
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        //!: Timer,
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(157, 155, 39, 176),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(3, 6),
                                    blurRadius: 10,
                                    color: Color.fromARGB(255, 134, 76, 205))
                              ]),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("$sec",
                                  style: const TextStyle(
                                      fontFamily: "DS-DIGITAL",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20))),
                        ),
                        //!: Score and heart
                        SizedBox(
                          width: 130,
                          child: Row(
                            children: [
                              Text(
                                "${score}",
                                style: F_pacifico.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Image.asset(
                                "assets/button/coin.png",
                                height: 16,
                              ),
                              Text(
                                "\t${heart}",
                                style: F_pacifico.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Image.asset(
                                "assets/button/heart.png",
                                height: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //!: Question and answer
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: size.height * .78,
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
                                  height: size.height * .044,
                                  width: size.width,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
                                    child: Text(
                                      // ignore: unnecessary_brace_in_string_interps
                                      "C??u h???i : ${currenIndex + 1}/${number}",
                                      style: F_pacifico.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  height: size.height * .2,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        155, 104, 106, 103),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${data[currenIndex]['name']}",
                                      style: F_pacifico.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                SizedBox(
                                  height: size.height * .52,
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
                                                // print("dung");
                                                tOrf = "????ng";
                                                score++;
                                                valueCauDung++;
                                                Ctrl++;
                                              } else {
                                                // ignore: avoid_print
                                                // print("Sai");
                                                lsColors[index] = Colors.red;
                                                tOrf = "sai";

                                                heart--;
                                                UpdateHeart();
                                              }
                                              UserSimplePreferences.setSLCD(
                                                  CauDung: Ctrl);
                                              UpdateHeart();
                                              FireStoredetailpack.saveData(
                                                  timer: defTimer - sec,
                                                  chucnang: "",
                                                  idlv: idlv,
                                                  cautraloi: lsAnswer[index]
                                                      .toString(),
                                                  cautldung: data[currenIndex]
                                                      ['a'],
                                                  causo: currenIndex + 1,
                                                  cauhoi: data[currenIndex]
                                                      ['name'],
                                                  tOrf: tOrf);
                                              setState(() {});
                                              if (currenIndex < number) {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: ((context) =>
                                                      AlertDialog(
                                                        backgroundColor:
                                                            Colors.green,
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();

                                                                startTimer();
                                                                currenIndex++;
                                                                PackageMethod.UpatePackage(
                                                                    currentIndex:
                                                                        currenIndex,
                                                                    index: idlv,
                                                                    Ctrl: Ctrl);

                                                                lsAnswer = [];
                                                                isLoadAnswer =
                                                                    false;
                                                                resetColor();

                                                                setState(() {});
                                                                if (currenIndex +
                                                                        1 >
                                                                    number) {
                                                                  isGameOver =
                                                                      true;
                                                                  timer!
                                                                      .cancel();
                                                                  showDialog(
                                                                      barrierDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder: ((context) =>
                                                                          AlertDialog(
                                                                            backgroundColor: const Color.fromARGB(
                                                                                255,
                                                                                167,
                                                                                79,
                                                                                225),
                                                                            title:
                                                                                const Text("Th??ng b??o", style: TextStyle(color: Colors.white)),
                                                                            content:
                                                                                Text("Ch??c m???ng $name ???? ho??n th??nh ${currenIndex}/${number} !!!\nS??? c??u ????ng l?? ${valueCauDung} ${heart > 0 ? 'Nh???n Ok ????? ho??n th??nh c??c th??? th??ch kh??c.' : 'Vui l??ng mua l?????t ????? ???????c ti???p t???c.'}", style: const TextStyle(color: Colors.white)),
                                                                            actions: [
                                                                              TextButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pushNamedAndRemoveUntil(context, 'welcome2', (route) => false);
                                                                                  },
                                                                                  child: const Text("Ok", style: TextStyle(color: Colors.white)))
                                                                            ],
                                                                          )));
                                                                }
                                                              },
                                                              child: const Text(
                                                                  "???? hi???u",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)))
                                                        ],
                                                        title: Text.rich(
                                                          TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "\n????p ??n l?? : ${data[currenIndex]['a']}",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white))
                                                              ],
                                                              text:
                                                                  "B???n ch???n : $tOrf",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      )),
                                                );
                                              } else {
                                                isGameOver = true;
                                                // ignore: avoid_print
                                                // print(
                                                //    "---------------------------------->Hoan thanh");

                                                // Navigator.of(context).push(
                                                //     MaterialPageRoute(
                                                //         builder: (_) =>
                                                //             WinScreen()));

                                                showDialog(
                                                    barrierDismissible: false,
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
                                                              "Th??ng b??o"),
                                                          content: Text(
                                                              "Ch??c m???ng $name ???? ho??n th??nh ${currenIndex + 1}/${number} !!!\nS??? c??u ????ng l?? ${valueCauDung} ${heart > 0 ? 'Nh???n Ok ????? ho??n th??nh c??c th??? th??ch kh??c.' : 'Vui l??ng mua l?????t ????? ???????c ti???p t???c.'}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white)),
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
                                                                    "Ok",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)))
                                                          ],
                                                        )));
                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          'welcome2',
                                                          (route) => false);
                                                });
                                              }
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Container(
                                              padding: const EdgeInsets.all(13),
                                              height: size.height * .115,
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      offset: Offset(3, 6),
                                                      color: Colors.black,
                                                      blurRadius: 16)
                                                ],
                                                border: Border.all(
                                                  width: 2,
                                                  color: white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: lsColors[index],
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${lsAnswer[index]}",
                                                  style: F_pacifico.copyWith(
                                                      color: white,
                                                      fontSize: 16),
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
                  height: size.height * .07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ignore: todo
                      //TODO: NextQuestion
                      GestureDetector(
                        onTap: _HoiKhanGia,
                        child: btnHelps(size: size, txt: "G???i ??"),
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
                        onTap: () => _Nextquestione(),
                        child: btnHelps(size: size, txt: "NextQuestion"),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
          color: const Color.fromARGB(255, 219, 59, 255),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: const Color.fromARGB(255, 228, 132, 15), width: 2),
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 13),
              color: Colors.black,
              blurRadius: 20,
            )
          ]),
      child: Align(
        child: Text(txt,
            style: F_popins.copyWith(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}
