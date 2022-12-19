import 'dart:math';

import 'package:flutter/material.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/models/category_model.dart';
import 'package:froggame/models/rank_model.dart';
import 'package:froggame/models/visit_friend_model.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/screens/profile/profileFriend_Screen.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:froggame/view_data/firestore_rank.dart';
import 'package:froggame/view_data/user_pre.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({super.key});

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class Located {
  double? top;
  double? left;
  double? right;
  double? bottom;
  Located(
      {required this.top,
      required this.left,
      required this.right,
      required this.bottom});
}

class _RankScreenState extends State<RankScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    await FutureRank.getAllData(selectedPack);

    var _dataCat = await FureStoreCategory.lsData;

    var _data = await FureStoreCategory.lsData;
    var _dataRank = await FutureRank.lstRank;
    setState(() {});
    goi = _data;

    lstTemp = _dataRank;

    getForIdlv();
    lstRank = lstTemp;
    //listCut();

    lstCat = _dataCat;
  }

  void getForIdlv() async {
    lstTemp.sort(
      (a, b) => b.score.compareTo(a.score),
    );
  }

  List<Image> lstFrames = [
    Image.asset('assets/frames/top1.png'),
    Image.asset('assets/frames/top2.png'),
    Image.asset('assets/frames/top3.png')
  ];

  List<Located> lstLocateTop3 = [
    Located(top: 20, left: 0, right: 0, bottom: 0),
    Located(top: 50, left: 0, right: 0, bottom: 0),
    Located(top: 1000, left: 0, right: 0, bottom: 0)
  ];

  List<rankModels> lstTemp = [];

  static List<Category> goi = [];

  static List<rankModels> lstRank = [];

  static List<Category> lstCat = [];

  var selectedPack = 0;

  var indexRank;

  List<FriendInfo> lstFr = [];

  List<rankModels> lstCut = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: goi.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                selectedPack = index;
                await FutureRank.getAllData(selectedPack);
                _loadData();
              },
              child: Container(
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedPack == index
                            ? const AssetImage('assets/button/btn_1/7.png')
                            : const AssetImage('assets/button/btn_1/9.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    '${goi[index].name}',
                    style: selectedPack == index
                        ? TextStyle(
                            color: Color.fromARGB(255, 250, 248, 248),
                            fontSize: 20,
                            fontWeight: FontWeight.w500)
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
        lstRank.length == 0
            ? Center(
                child: Container(
                child: Text(
                  'Chưa có người chơi',
                  style: TextStyle(fontSize: 40, color: Colors.red),
                ),
              ))
            : Container(
                height: 140,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                width: size.width * 0.95,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Positioned(
                        top: lstLocateTop3[index].top,
                        right: lstLocateTop3[index].right,
                        child: _lstTop3(context, index));
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: size.height * 0.4,
              width: size.width * 0.95,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      lstRank.length,
                      (indexTemp) => indexTemp > 2
                          ? _top10(context, indexTemp)
                          : Container()),
                ),
              ),
            )),
      ],
    );
  }

  var indexTemp = 3;
  @override
  // _top3(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(top: 40),
  //         child: Container(
  //           child: Column(
  //             children: [
  //               Container(
  //                 child: Stack(
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.all(12),
  //                       child: Container(
  //                         height: 70,
  //                         width: 70,
  //                         decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             image: DecorationImage(
  //                                 image: NetworkImage(lstRank[1].avatar))),
  //                         // height: 50,
  //                         // width: 50,
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 90,
  //                       width: 90,
  //                       child: Image.asset('assets/frames/top2.png'),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 child: Text(
  //                   '${lstRank[1].score}',
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //       Container(
  //         child: Column(
  //           children: [
  //             Container(
  //               child: Stack(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(25),
  //                     child: Container(
  //                       height: 70,
  //                       width: 70,
  //                       decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           image: DecorationImage(
  //                               image: NetworkImage(lstRank[0].avatar))),
  //                       // height: 50,
  //                       // width: 50,
  //                     ),
  //                   ),
  //                   Container(
  //                     height: 120,
  //                     width: 120,
  //                     child: Image.asset('assets/frames/top1.png'),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               child: Text('${lstRank[0].score}',
  //                   style:
  //                       TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  //             )
  //           ],
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 40),
  //         child: Container(
  //           child: Column(
  //             children: [
  //               Container(
  //                 child: Stack(
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.all(8),
  //                       child: Container(
  //                         height: 70,
  //                         width: 70,
  //                         decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             image: DecorationImage(
  //                                 image: NetworkImage(lstRank[2].avatar))),
  //                         // height: 50,
  //                         // width: 50,
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 80,
  //                       width: 80,
  //                       child: Image.asset('assets/frames/top3.png'),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 child: Text('${lstRank[3].score}',
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  _top10(BuildContext context, int indexTemp) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: size.width * 0.95,
        decoration: BoxDecoration(
          color: lstColor[Random().nextInt(lstColor.length)],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 100,
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.pink),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(lstRank[indexTemp].avatar))),
                // height: 50,
                // width: 50,
              ),
            ),
            Positioned(
              left: 100,
              top: 20,
              child: Container(
                height: 80,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${indexTemp + 1}',
                      style: F_lobster.copyWith(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${lstRank[indexTemp].NamePlayer}',
                      style: F_pacifico.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          indexRank = indexTemp;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.purple.shade100,
                            title: RichText(
                              text: TextSpan(
                                text: 'Xem thông tin \n',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 75, 54, 159),
                                  fontSize: 20,
                                ),
                                children: [
                                  TextSpan(
                                      text: lstRank[indexRank].NamePlayer,
                                      style: F_pacifico.copyWith(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontFamily: 'quick',
                                          fontWeight: FontWeight.w200)),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                              ElevatedButton(
                                onPressed: () async {
                                  setState(
                                    () {
                                      lstFr.add(FriendInfo(
                                          avatar: lstRank[indexTemp].avatar,
                                          name: lstRank[indexTemp].NamePlayer,
                                          iduser: lstRank[indexTemp].iduser,
                                          lstCat: lstCat,
                                          score: lstRank[indexTemp].score));
                                    },
                                  );
                                  nextScreen(
                                    context,
                                    ProfileFriendScreen(
                                      lstProfile: lstFr,
                                    ),
                                  );
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.more_horiz_outlined),
                    ),
                    Container(
                      child: Text(
                        '${lstRank[indexTemp].score}',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  _NextScreenTop3(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        onPressed:
        () {
          setState(() {
            // indexRank = indexTemp;
          });
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.purple.shade100,
              title: RichText(
                text: TextSpan(
                  text: 'Xem thông tin \n',
                  style: TextStyle(
                    color: Color.fromARGB(255, 75, 54, 159),
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                        text: lstRank[index].NamePlayer,
                        style: F_pacifico.copyWith(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: 'quick',
                            fontWeight: FontWeight.w200)),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                ElevatedButton(
                  onPressed: () async {
                    setState(
                      () {
                        lstFr.add(FriendInfo(
                            avatar: lstRank[index].avatar,
                            name: lstRank[index].NamePlayer,
                            iduser: lstRank[index].iduser,
                            lstCat: lstCat,
                            score: lstRank[index].score));
                      },
                    );
                    nextScreen(
                      context,
                      ProfileFriendScreen(
                        lstProfile: lstFr,
                      ),
                    );
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        };
      },
    );
  }

  @override
  @override
  _lstTop3(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(lstRank[index].avatar))),
              // height: 50,
              // width: 50,
            ),
          ),
          Container(
            height: 90,
            width: 90,
            child: lstFrames[index],
          ),
          Positioned(
            top: 100,
            left: 40,
            child: Container(
              child: Text(
                '${lstRank[index].score}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
