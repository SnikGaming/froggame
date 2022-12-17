import 'dart:math';
import 'package:flutter/material.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/models/category_model.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/screens/gameplay/game_play_screen.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../const/colors.dart';
import '../../const/font_app.dart';
import '../../view_data/firesore_questions.dart';
import '../../view_data/package_method.dart';
import '../../view_data/user_pre.dart';

class TypeQuestionPage extends StatefulWidget {
  const TypeQuestionPage({super.key});

  @override
  State<TypeQuestionPage> createState() => _TypeQuestionPageState();
}

class _TypeQuestionPageState extends State<TypeQuestionPage> {
  String name = UserSimplePreferences.getName() == ""
      ? UserSimplePreferences.getUsername()
      : UserSimplePreferences.getName();
  List<Category> lsCategory = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    FureStoreCategory.getAllData();
    lsCategory = FureStoreCategory.lsData;
    setState(() {});
  }

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
                // ignore: sort_child_properties_last
                child: Container(),

                flex: 1,
              ),
              UserHeader(height: size.height * .1, context: context),
              Flexible(
                // ignore: sort_child_properties_last
                child: Container(),
                flex: 1,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: size.height * .82,
                child: ListView.builder(
                  itemCount: lsCategory.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 20, right: 20),
                      child: Container(
                        height: size.height * .2,
                        width: size.width,
                        decoration: BoxDecoration(
                          color:
                              // ignore: unnecessary_new
                              list2[new Random().nextInt(list2.length)],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(children: [
                          Positioned(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: SizedBox(
                                height: size.height * .2,
                                width: size.width - 40,
                                child: Stack(
                                  // ignore: prefer_const_literals_to_create_immutables
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
                            // ignore: sort_child_properties_last
                            child: AnimatedCus(
                              context: context,
                              s: 1500,
                              x: 150,
                              y: -150,
                              curve: Curves.elasticIn,
                              chil: Image.network(lsCategory[index].img),
                            ),
                            height: 170,
                          ),
                          Positioned(
                              left: 20,
                              top: 30,
                              child: AnimatedCus(
                                  x: -250,
                                  curve: Curves.elasticInOut,
                                  context: context,
                                  chil: Text(
                                    lsCategory[index].name,
                                    style: F_permanent.copyWith(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ))),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: GestureDetector(
                              onTap: () {
                                if (UserSimplePreferences.getHeart() < 1) {
                                  Alert(
                                    context: context,
                                    title: "THÔNG BÁO",
                                    desc:
                                        "BẠN ĐÃ HẾT HEART VUI LÒNG NẠP THÊM TIỀN ĐỂ TIẾP TỤC TRÒ CHƠI...",
                                    image: Image.asset("assets/234.webp"),
                                  ).show();
                                } else {
                                  PackageMethod.createPackage(index: index + 1)
                                      .then((value) => {
                                            if (PackageMethod.idch <
                                                FureStoreQuestions.count[index])
                                              {
                                                // timerSnackbar(
                                                //   context: context,
                                                //   contentText:
                                                //       "Vui lòng đợi... thời gian có thể lâu hơn mong đợi ❤️",
                                                //   buttonPrefixWidget:
                                                //       Image.asset(
                                                //     'assets/images/frogkimono.webp',
                                                //     width: 17.0,
                                                //     height: 15.0,
                                                //     alignment: Alignment
                                                //         .topCenter,
                                                //     color: const Color
                                                //             .fromARGB(
                                                //         255,
                                                //         144,
                                                //         11,
                                                //         239),
                                                //   ),
                                                //   afterTimeExecute: () {
                                                //     if (PackageMethod
                                                //             .idch <
                                                //         30) {
                                                //       PackageMethod
                                                //               .isLoad
                                                //           ? PackageMethod
                                                //                   .idch =
                                                //               PackageMethod
                                                //                   .idch
                                                //           : PackageMethod
                                                //               .idch = 0;

                                                //       Navigator.of(
                                                //               context)
                                                //           .push(MaterialPageRoute(
                                                //               builder: (_) =>
                                                //                   QuizzGameScreen(
                                                //                       idlv: index + 1)));
                                                //     }
                                                //   },
                                                //   second: 3,
                                                // ),
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            QuizzGameScreen(
                                                                idlv:
                                                                    index + 1)))
                                              }
                                            else
                                              {
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
                                                              "Thông báo",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: white,
                                                                  fontSize:
                                                                      24)),
                                                          content: Text(
                                                              "$name đã hoàn thành lĩnh vực ${lsCategory[index].name} !!!\nHãy hoàn thành các thử thách khác.",
                                                              style:
                                                                  const TextStyle(
                                                                      color:
                                                                          white)),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    "Đã hiểu",
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          white,
                                                                    )))
                                                          ],
                                                        )))
                                              }
                                          });
                                }

                                //pushNamedRemove(context, "gameplay");
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
                                  borderRadius: BorderRadius.circular(17),
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
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
