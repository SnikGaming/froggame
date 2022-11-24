import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import '../../const/colors.dart';
import '../../const/font_app.dart';
import '../../const/str_Type.dart';
import '../gameplay/quizz_screen.dart';

class TypeQuestionPage extends StatefulWidget {
  const TypeQuestionPage({super.key});

  @override
  State<TypeQuestionPage> createState() => _TypeQuestionPageState();
}

class _TypeQuestionPageState extends State<TypeQuestionPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: linearGradient,
          ),
          child: Column(
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              UserHeader(height: size.height * .1),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Container(
                height: size.height * .82,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FureStoreCategory.StreamCategories,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!.docs;
                      List<String> lsCategories = [];
                      for (var row in data) {
                        final r = row.data() as Map<String, dynamic>;
                        lsCategories.add(r['name']);
                      }
                      return ListView.builder(
                          itemCount: lsCategories.length,
                          itemBuilder: ((context, index) {
                            TypeModel type = TypeModel.listType[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, left: 20, right: 20),
                              child: Container(
                                height: size.height * .2,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color:
                                      list2[new Random().nextInt(list2.length)],
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
                                        "${lsCategories[index]}",
                                        style: F_permanent.copyWith(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      )),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        pushNamedRemove(context, "gameplay");
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
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
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                        child: Text(
                                          "CHƠI",
                                          style: F_popins.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          }));
                    } else {
                      return CupertinoActivityIndicator(
                        color: Colors.orange,
                      );
                    }
                  },
                ),
              ),

              // Container(
              //   height: size.height * .87,
              //   child: ListView.builder(
              //       itemCount: TypeModel.listType.length,
              //       itemBuilder: ((context, index) {
              //         TypeModel type = TypeModel.listType[index];
              //         return Padding(
              //           padding: const EdgeInsets.only(
              //               bottom: 8.0, left: 20, right: 20),
              //           child: Container(
              //             height: size.height * .2,
              //             width: size.width,
              //             decoration: BoxDecoration(
              //               color: list2[new Random().nextInt(list2.length)],
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //             child: Stack(children: [
              //               Positioned(
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(30),
              //                   child: Container(
              //                     height: size.height * .2,
              //                     width: size.width - 40,
              //                     child: Stack(
              //                       children: [
              //                         // Image.network(
              //                         //     "https://media.giphy.com/media/CPO9ZmnEiDcdLXMrzv/giphy.gif")
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Positioned(
              //                 right: 20,
              //                 bottom: 0,
              //                 child: Image.asset(type.image),
              //                 height: 170,
              //               ),
              //               Positioned(
              //                   left: 20,
              //                   top: 30,
              //                   child: Text(
              //                     type.name,
              //                     style: F_permanent.copyWith(
              //                         color: white,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 30),
              //                   )),
              //               Positioned(
              //                 bottom: 20,
              //                 left: 20,
              //                 child: GestureDetector(
              //                   onTap: () {
              //                     nextScreen(context, QuizzScreen());
              //                   },
              //                   child: Container(
              //                     padding: const EdgeInsets.symmetric(
              //                         horizontal: 20, vertical: 10),
              //                     decoration: BoxDecoration(
              //                       boxShadow: const [
              //                         BoxShadow(
              //                             offset: Offset(1, 2),
              //                             blurRadius: 10,
              //                             color: Colors.orange),
              //                         BoxShadow(
              //                             offset: Offset(1, 3),
              //                             blurRadius: 10,
              //                             color: Colors.orange)
              //                       ],
              //                       color: Colors.orange,
              //                       borderRadius: BorderRadius.circular(17),
              //                     ),
              //                     child: Text(
              //                       "CHƠI",
              //                       style: F_popins.copyWith(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 18),
              //                     ),
              //                   ),
              //                 ),
              //               )
              //             ]),
              //           ),
              //         );
              //       })),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
