import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/api_services.dart';
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
          width: double.infinity,
          height: double.infinity,
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
                      BOX(height: 10),
                      // Image.asset(
                      //   frog,
                      //   width: 200,
                      // ),
                      Image.asset(
                        frog_sure,
                        width: 120,
                      ),
                      BOX(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: normalText(
                            text:
                                "Question ${currentQuestionIndex + 1}/${data.length}",
                            color: lightgrey,
                            size: 18),
                      ),
                      //box
                      BOX(height: 20),
                      normalText(
                          text: data[currentQuestionIndex]["question"],
                          color: lightgrey,
                          size: 20),
                      BOX(height: 20),

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: optionsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var answer =
                                data[currentQuestionIndex]["correct_answer"];
                            return GestureDetector(
                              onTap: () {
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
                          })
                      //tro giup
                      ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonCustom(text: "50:50 (-2)"),
                          ButtonCustom(text: "+15s (-2)"),
                          ButtonCustom(text: "+15s (-2)"),
                        ],
                      ) //close
                      ,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: lightgrey, width: 2)),
                        child: IconButton(
                          onPressed: () {
                            exit(0);
                          },
                          icon: Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
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

Widget ButtonCustom({
  text,
}) {
  return ElevatedButton(
      onPressed: () {}, child: normalText(text: text, size: 18));
}
