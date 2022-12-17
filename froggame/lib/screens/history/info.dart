// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:froggame/screens/history/HistoryScreen.dart';
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
              height: size.height * 0.18,
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
                        Container(),
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
                                playInfomation[index],
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
                height: size.height * 0.72,
                width: size.width * 0.95,
                child:
                    HistoryScreen()), //isClickEvent ? HistoryScreen() : rank(context)),
            Flexible(
              // ignore: sort_child_properties_last
              child: Container(),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  // Widget historyPlay(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: List.generate(
  //         FutureHistory.lst.length < 10 ? FutureHistory.lst.length : 10,
  //         (index) => Card(
  //           color: bg2,
  //           child: Container(
  //             padding: const EdgeInsets.only(left: 10),
  //             height: 75,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Container(
  //                       width: 60,
  //                       height: 60,
  //                       decoration: BoxDecoration(
  //                         color: const Color.fromARGB(255, 42, 226, 171),
  //                         borderRadius: BorderRadius.circular(100),
  //                       ),
  //                       child: Center(
  //                           child: Image.asset(TypeModel
  //                               .listType[FutureHistory.idlv[index]].image)),
  //                     ),
  //                     const Padding(padding: EdgeInsets.all(10)),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(FutureHistory.lst[index].catName,
  //                             style: F_pacifico.copyWith(
  //                                 fontSize: 27,
  //                                 color: white,
  //                                 fontWeight: FontWeight.w500)),
  //                         Text(
  //                           FutureHistory.lst[index].timer,
  //                           style: F_popins.copyWith(fontSize: 15),
  //                         )
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Container(
  //                   width: 100,
  //                   margin: const EdgeInsets.only(right: 10),
  //                   padding: const EdgeInsets.only(
  //                       top: 10, right: 20, left: 20, bottom: 10),
  //                   decoration: BoxDecoration(
  //                       color: const Color.fromARGB(255, 61, 94, 238),
  //                       borderRadius: BorderRadius.circular(30)),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Icon(
  //                         Icons.star_rate_outlined,
  //                         color: Colors.yellow,
  //                       ),
  //                       Text(
  //                         FutureHistory.lst[index].score,
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   Widget rank(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         //ignore: sized_box_for_whitespace

//         // ignore: sized_box_for_whitespace
//         Container(
//           height: size.height * 0.55,
//           child: ListRank(context),
//         ),
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: Container(
//         //     height: 80,
//         //     width: 360,
//         //     decoration: BoxDecoration(
//         //       borderRadius: BorderRadius.circular(15),
//         //       color: const Color.fromARGB(255, 212, 86, 185),
//         //     ),
//         //     // ignore: sort_child_properties_last
//         //     child: Row(
//         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //       children: [
//         //         const Text('100+.',
//         //             style:
//         //                 TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
//         //         Row(
//         //           children: [
//         //             Container(
//         //               height: 70,
//         //               width: 60,
//         //               decoration: BoxDecoration(
//         //                   color: const Color.fromARGB(255, 76, 129, 241),
//         //                   borderRadius: BorderRadius.circular(30)),
//         //             ),
//         //             const SizedBox(
//         //               width: 5,
//         //             ),
//         //           ],
//         //         ),
//         //         Row(
//         //           children: const [
//         //             Text(
//         //               '100',
//         //               style: TextStyle(
//         //                   fontWeight: FontWeight.w500,
//         //                   fontSize: 18,
//         //                   color: white),
//         //             ),
//         //             SizedBox(
//         //               width: 30,
//         //             ),
//         //           ],
//         //         )
//         //       ],
//         //     ),
//         //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         //   ),
//         // ),
//       ],
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Widget ListRank(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: List.generate(
//           lstRankSort.length < 10 ? lstRankSort.length : 10,
//           (index) => Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 80,
//               width: 360,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: const Color.fromARGB(255, 76, 129, 241),
//               ),
//               // ignore: sort_child_properties_last
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       Text('${index + 1}. ',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18)),
//                       Container(
//                         width: 80,
//                         height: 100,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(40)),
//                         child: Image.network(
//                           lstRankSort[index].avatar,
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       Text(lstRankSort[index].NamePlayer,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18,
//                               color: white))
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '${lstRankSort[index].score}',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                             color: white),
//                       ),
//                       SizedBox(
//                         width: 30,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
}
