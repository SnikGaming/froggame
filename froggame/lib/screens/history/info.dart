import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/view_data/firestore_categories.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

import '../../const/colors.dart';
import '../../const/str_Type.dart';

// ignore: camel_case_types
class infomation_screen extends StatefulWidget {
  const infomation_screen({super.key});

  @override
  State<infomation_screen> createState() => _infomation_screenState();
  
}
  List<String>dt=[];

var selected = FureStoreCategory.lst[0];



// ignore: camel_case_types
class _infomation_screenState extends State<infomation_screen> {
  
  bool isClickEvent = true;
  // ignore: non_constant_identifier_names
  bool isColor_history = true;
  // ignore: non_constant_identifier_names
  bool isColor_rank = false;
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size *0.105;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bg1, bg2])),
        child: Column(

          children: [
            Container(
              width: 370,
              height: size.height ,
              margin: const EdgeInsets.only(top: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [bg1, bg2]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline_rounded),
                              Text('Thông tin',
                                  style: F_lobster.copyWith(
                                      fontSize: 20, color: white))
                            ],
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 105)),
                        GestureDetector (
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            color: red,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            isClickEvent = true;
                            setState(() {
                              isColor_history = true;
                              isColor_rank = false;
                            });
                          },
                          child: _btnInfo(
                            context,
                            isColor_history,
                            'Lịch sử',
                          )),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isClickEvent = false;
                              isColor_history = false;
                              isColor_rank = true;
                            },
                          );
                        },
                        child: _btnInfo(context, isColor_rank, 'Xếp hạng'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                height: 700,
                child: isClickEvent ? historyPlay(context) : rank(context)),
            //   Container(
            //   color: red,height: 100,
            // ),
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

  Widget _btnInfo(BuildContext context, bool checkOntap, String chiEvent) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: checkOntap ? green : white),
      child: Center(
        child: Text(
          chiEvent,
          style: F_permanent .copyWith(fontSize: 20),
        ),
      ),
    );
  }

  Widget historyPlay(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          FureStoreCategory.lst.length,
          (index) => Card(
            color: bg2,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 42, 226, 171),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Image.asset(TypeModel.listType[index].image)
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(FureStoreCategory.lst[index],
                              style: F_pacifico .copyWith(
                                  fontSize: 27,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            '1p30',
                            style: F_popins.copyWith(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.only(
                        top: 10, right: 20, left: 20, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 61, 94, 238),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.star_rate_outlined,
                          color: Colors.yellow,
                        ),
                        Text(
                          '100',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rank(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FureStoreCategory.lst.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap:() {
                selected = FureStoreCategory.lst[index];

                setState(() {
                  
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    color: selected == FureStoreCategory.lst[index] ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    FureStoreCategory.lst[index],
                    style: F_lobster.copyWith(fontSize: 20)
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        // ignore: sized_box_for_whitespace
        Container(
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 76, 129, 241),
                    ),
                    // ignore: sort_child_properties_last
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Text('${index + 1}.',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                            const CircleAvatar(),
                            const Text('Phong',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: white))
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              '100',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: white),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 212, 86, 185),
            ),
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('100+.',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 76, 129, 241),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      '100',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: white),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
        ),
      ],
    );
  }
}
