// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/text_style.dart';
import 'package:froggame/models/rank_model.dart';
import 'package:froggame/screens/history/BattleScreen.dart';
import 'package:froggame/screens/history/HistoryScreen.dart';
import 'package:froggame/screens/history/RankScreen.dart';
import 'package:froggame/view_data/firestore_history.dart';
import 'package:froggame/view_data/firestore_rank.dart';
import 'package:froggame/view_data/firestore_user.dart';
import 'package:froggame/view_data/user_pre.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

import '../../const/colors.dart';

// ignore: camel_case_types
class infomation_screen extends StatefulWidget {
  const infomation_screen({super.key});
  @override
  State<infomation_screen> createState() => _infomation_screenState();
}

var selected = 0;
var indexLst = 1;

// ignore: camel_case_types
class _infomation_screenState extends State<infomation_screen> {
//data

  List<String> playInfomation = ['Lịch sử', 'Xếp hạng', 'Thách đấu'];
  List<Widget> lstScreen = [
    HistoryScreen(
      index: 0,
    ),
    RankScreen(),
    BattleScreen(),
  ];

//sửa
  // static void lstId() {
  //   for (var i in FutureRank.lstRank) {
  //     if (i.idlv == selected + 1) {
  //       lstRankSort.add(i);
  //       // print(
  //       //     '========= idlv  =====================${i.idlv} name: ${i.NamePlayer} score: ${i.score} index $indexLst');
  //     }
  //   }
  //   FutureRank.lstRank.clear();
  // }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    FutureHistory.getAllDataPack(1);
    FutureRank.getAllData(1, UserSimplePreferences.getUserId());
    // FutureHistory.getListHistory();
    // lsHs = FutureHistory.lsHistory;
    //lstId();
    // print(
    //     '================================length=================${lstRankSort.length}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [purple, lightgrey])),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.23,
              decoration: BoxDecoration(
                  gradient: background,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(top: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            child: headingText(
                                text: UserSimplePreferences.getName() != ""
                                    ? UserSimplePreferences.getName()
                                    : UserSimplePreferences.getUsername(),
                                color: white,
                                size: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/button/close.png'),
                                        fit: BoxFit.cover)),
                              )),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        playInfomation.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                              FutureRank.getAllData(
                                  1, UserSimplePreferences.getUserId());

                              //History
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: selected == index
                                        ? AssetImage(
                                            'assets/button/btn_1/7.png')
                                        : AssetImage(
                                            'assets/button/btn_1/9.png'),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: Text(
                                '${playInfomation[index]}',
                                style: selected == index
                                    ? TextStyle(
                                        color: white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: size.height * 0.7,
              width: size.width * 0.95,
              child: lstScreen[selected],
            ), //isClickEvent ? HistoryScreen() : rank(context)),
          ],
        ),
      ),
    );
  }
}
