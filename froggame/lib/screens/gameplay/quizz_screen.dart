import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/screens/login/login_page.dart';
import '../../network/api_services.dart';
import '../../const/images.dart';
import '../../const/text_style.dart';
import '../../const/values.dart';
import '../../const/colors.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  @override
  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  _Loc50phantram() {
    if (score >= 2) {
      score = score - 2;
      print("a");
      setState(() {});
    } else {
      print("Khong du meney");
    }
  }

  _Them15s() {
    if (score >= 2) {
      score = score - 2;

      print("15s");
      setState(() {});
    } else {
      print("Khong du meney");
    }
  }

  _Nextquestione() {
    if (score >= 4) {
      score = score - 4;

      print("NExt");
      setState(() {});
    } else {
      print("Khong du meney");
    }
  }

  int seconds = ValuesGame.seconds;
  Timer? timer;
  var currentQuestionIndex = 0;
  late Future quiz;
  int SL = 0;
  var isLoaded = false;
  int score = 0;
  int heart = ValuesGame.heart;
  var optionsList = [];
  resetColor() {
    optionsColors = [
      Color.fromARGB(158, 228, 235, 125),
      Color.fromARGB(179, 155, 244, 54),
      Color.fromARGB(166, 54, 244, 127),
      Color.fromARGB(174, 54, 244, 171)
    ];
  }

  var optionsColors = [
    Color.fromARGB(158, 228, 235, 125),
    Color.fromARGB(179, 155, 244, 54),
    Color.fromARGB(166, 54, 244, 127),
    Color.fromARGB(174, 54, 244, 171)
  ];
  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  bool isGameOver = false;
  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;
        if (seconds < 0 && heart > 0) {
          currentQuestionIndex++;
          heart--;

          seconds = ValuesGame.seconds;
        }
        if (heart <= 0) {
          heart = 0;
          seconds = 0;
          isGameOver = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [bg1, bg2])),
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data["results"];
                SL = data.length;
                if (!isLoaded) {
                  optionsList = data[currentQuestionIndex]["incorrect_answers"];
                  optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                  optionsList.shuffle();
                  isLoaded = true;
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //close
                          Container(
                            decoration: BoxDecoration(
                              // border: Border.all(color: white, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.money_dollar_circle,
                                  color: yellow,
                                ),
                                label: normalText(
                                    text: score.toString(),
                                    color: white,
                                    size: 14)),
                          ),
                          //Seconds
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              normalText(
                                  text: "$seconds", size: 22, color: white),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CircularProgressIndicator(
                                  value: seconds / ValuesGame.seconds,
                                  valueColor:
                                      const AlwaysStoppedAnimation(white),
                                ),
                              )
                            ],
                          ),

                          //like normal
                          Container(
                            decoration: BoxDecoration(
                              ///  border: Border.all(color: white, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: red,
                                ),
                                label: normalText(
                                    text: heart.toString(),
                                    color: white,
                                    size: 14)),
                          )
                        ],
                      ),
                       const    SizedBox(height: 10),
                      // Image.asset(
                      //   frog,
                      //   width: 200,
                      // ),
                      Image.asset(
                        frog_sure,
                        width: 120,
                      ),
                  const    SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: normalText(
                            text:
                                "Question ${currentQuestionIndex + 1}/${data.length}",
                            color: lightgrey,
                            size: 18),
                      ),
                      //box
                    const  SizedBox(height: 20),
                      normalText(
                          text: data[currentQuestionIndex]["question"],
                          color: lightgrey,
                          size: 20),
                      const SizedBox(height: 20),

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: optionsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var answer =
                                data[currentQuestionIndex]["correct_answer"];
                            return GestureDetector(
                              onTap: () {
                                if (currentQuestionIndex + 1 >= SL ||
                                    (currentQuestionIndex + 1 >= SL &&
                                        seconds <= 0)) {
                                  timer!.cancel();
                                  return nextScreen(context, SiginPage());
                                }
                                if (!isGameOver) {
                                  bool YN;

                                  if (answer.toString() ==
                                      optionsList[index].toString()) {
                                    optionsColors[index] = green;
                                    YN = true;
                                  } else {
                                    optionsColors[index] = red;
                                    YN = false;
                                  }
                                  if (currentQuestionIndex < data.length - 1) {
                                    Future.delayed(
                                        Duration(
                                            milliseconds: ValuesGame.delay),
                                        () {
                                      currentQuestionIndex++;
                                      isLoaded = false;
                                      resetColor();
                                      timer!.cancel();
                                      seconds = ValuesGame.seconds;
                                      startTimer();
                                      setState(() {
                                        if (YN) {
                                          score++;
                                          YN = false;
                                        } else {
                                          heart--;
                                        }
                                      });
                                    });
                                  } else {}
                                }
                              },
                              child: Container(
                                width: size.width - 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: optionsColors[index],
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: headingText(
                                    text: optionsList[index].toString(),
                                    size: 18,
                                    color: blue),
                              ),
                            );
                          }),

                      //tro giup
                      SizedBox(
                        height: 50,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonCustom(
                              text: "-2🪙\n50/50",
                              img: "assets/images/50_50.png",
                              ontap: _Loc50phantram),
                          ButtonCustom(
                              text: "-2🪙\n+15s",
                              img: "assets/images/15s.png",
                              ontap: _Them15s),
                          ButtonCustom(
                              text: "-4🪙\nĐổi câu hỏi",
                              img: "assets/images/next.png",
                              ontap: _Nextquestione),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(white),
                  ),
                );
              }
            },
          )),
    ));
  }
}

Widget ButtonCustom({text, img, ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 60,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(0, 2), blurRadius: 5, color: Colors.lightBlue)
      ], color: Colors.lightBlue, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Image.asset(
            img,
            height: 40,
          ),
          headingText(text: text, size: 18)
        ],
      ),
    ),
  );
}
