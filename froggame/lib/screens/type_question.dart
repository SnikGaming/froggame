import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../const/colors.dart';
import '../const/type_model.dart';
import 'gameplay/quizz_screen.dart';

class TypeQuestionPage extends StatefulWidget {
  const TypeQuestionPage({super.key});

  @override
  State<TypeQuestionPage> createState() => _TypeQuestionPageState();
}

class _TypeQuestionPageState extends State<TypeQuestionPage> {
  // _maingame() {
  //   nextScreen(context, ());
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        child: CircleAvatar(
                          child: Image.network(
                            UserSimplePreferences.getUserPic(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        UserSimplePreferences.getUsername(),
                        style: popins.copyWith(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                  Text(
                    "${UserSimplePreferences.getHeart()} ❤️",
                    style: popins.copyWith(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "${UserSimplePreferences.getScore()} 🪙",
                    style: popins.copyWith(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              height: size.height * .9,
              child: ListView.builder(
                  itemCount: TypeModel.listType.length,
                  itemBuilder: ((context, index) {
                    TypeModel type = TypeModel.listType[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 20, right: 20),
                      child: Container(
                        height: size.height * .2,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: list2[new Random().nextInt(list2.length)],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(children: [
                          Positioned(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: size.height * .2,
                                width: size.width - 40,
                                child: Stack(
                                  children: [
                                    // Image.network(
                                    //     "https://media.giphy.com/media/CPO9ZmnEiDcdLXMrzv/giphy.gif")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: 0,
                            child: Image.asset(type.image),
                            height: 170,
                          ),
                          Positioned(
                              left: 20,
                              top: 30,
                              child: Text(
                                type.name,
                                style: permanent.copyWith(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              )),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: GestureDetector(
                              onTap: () {
                                nextScreen(context, QuizzScreen());
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(1, 2),
                                        blurRadius: 10,
                                        color: Colors.orange),
                                    BoxShadow(
                                        offset: Offset(1, 3),
                                        blurRadius: 10,
                                        color: Colors.orange)
                                  ],
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: Text(
                                  "CHƠI",
                                  style: popins.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
