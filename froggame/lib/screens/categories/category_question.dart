import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/screens/gameplay/quizz_game_screen.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:timer_snackbar/timer_snackbar.dart';
import '../../const/colors.dart';
import '../../const/font_app.dart';
import '../../const/str_Type.dart';
import '../../view_data/package_method.dart';
import '../../view_data/user_pre.dart';

class TypeQuestionPage extends StatefulWidget {
  const TypeQuestionPage({super.key});

  @override
  State<TypeQuestionPage> createState() => _TypeQuestionPageState();
}

class _TypeQuestionPageState extends State<TypeQuestionPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
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
              UserHeader(height: size.height * .1),
              Flexible(
                // ignore: sort_child_properties_last
                child: Container(),
                flex: 1,
              ),
              // ignore: sized_box_for_whitespace
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
                                    child: Image.asset(type.image),
                                    height: 170,
                                  ),
                                  Positioned(
                                      left: 20,
                                      top: 30,
                                      child: Text(
                                        // ignore: unnecessary_string_interpolations
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
                                        // FureStorePackageQuestions.update(
                                        //     index: index + 1);
                                        PackageMethod.createPackage(
                                            index: index + 1, context: context);
                                        if (UserSimplePreferences.getHeart() <
                                            1) {
                                          Alert(
                                            context: context,
                                            title: "THÔNG BÁO",
                                            desc:
                                                "BẠN ĐÃ HẾT HEART VUI LÒNG NẠP THÊM TIỀN ĐỂ TIẾP TỤC TRÒ CHƠI...",
                                            image:
                                                Image.asset("assets/cayyy.gif"),
                                          ).show();
                                        } else {
                                          PackageMethod.createPackage(
                                                  index: index + 1)
                                              .then((value) => {
                                                    // ScaffoldMessenger.of(
                                                    //         context)
                                                    //     .showSnackBar(
                                                    //         const SnackBar(
                                                    //             duration:
                                                    //                 Duration(
                                                    //                     seconds:
                                                    //                         10),
                                                    //             content: Text(
                                                    //                 "Vui lòng đợi.."))),
                                                    if (PackageMethod.idch < 30)
                                                      {
                                                        timerSnackbar(
                                                          context: context,
                                                          contentText:
                                                              "Vui lòng đợi... thời gian có thể lâu hơn mong đợi ❤️",
                                                          buttonPrefixWidget:
                                                              Image.asset(
                                                            'assets/images/frogkimono.webp',
                                                            width: 17.0,
                                                            height: 15.0,
                                                            alignment: Alignment
                                                                .topCenter,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                144,
                                                                11,
                                                                239),
                                                          ),
                                                          afterTimeExecute: () {
                                                            if (PackageMethod
                                                                    .idch <
                                                                30) {
                                                              PackageMethod
                                                                      .isLoad
                                                                  ? PackageMethod
                                                                          .idch =
                                                                      PackageMethod
                                                                          .idch
                                                                  : PackageMethod
                                                                      .idch = 0;

                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder: (_) =>
                                                                          QuizzGameScreen(
                                                                              idlv: index + 1)));
                                                            }
                                                          },
                                                          second: 3,
                                                        ),
                                                      }
                                                    else
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                ((context) =>
                                                                    AlertDialog(
                                                                      backgroundColor: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          167,
                                                                          79,
                                                                          225),
                                                                      title: const Text(
                                                                          "Thông báo"),
                                                                      content: Text(
                                                                          "${UserSimplePreferences.getUsername()} đã hoàn thành lĩnh vực ${lsCategories[index]} !!!\nNhấn Ok để hoàn thành các thử thách khác."),
                                                                      actions: [
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                const Text("Ok"))
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
                      return const CupertinoActivityIndicator(
                        color: Colors.orange,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
