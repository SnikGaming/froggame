import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/colors.dart';

class infomation_screen extends StatefulWidget {
  const infomation_screen({super.key});

  @override
  State<infomation_screen> createState() => _infomation_screenState();
}

List<String> goi = [
  'lịch sử',
  'Khoa học',
  'Địa lí',
  'Toán học',
  'Văn học',
  'Khoa học',
  'Vật lí',
  'Đố mẹo'
];

class _infomation_screenState extends State<infomation_screen> {
  bool isClickEvent = true;
  bool isColor_history = true;
  bool isColor_rank = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bg1, bg2])),
        child: Column(
          children: [
            Container(
              width: 370,
              height: 100,
              margin: EdgeInsets.only(top: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [bg1, bg2]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline_rounded),
                              Text(
                                'Thông tin',
                                style: GoogleFonts.abel(textStyle: TextStyle(color: Colors.red))
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 105)),
                        Container(
                          child: Icon(
                            Icons.close_rounded,
                            color: red,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
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
                            child: _btnInfo(context, isColor_rank, 'Xếp hạng')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 10),
                height: 700,
                child: isClickEvent ? historyPlay(context) : rank(context)),
        //   Container(
        //   color: red,height: 100,
        // ),
        Flexible(child: Container(),flex: 1,)
         
          ],
        ),
      ),
    );
  }

  @override
  Widget _btnInfo(BuildContext context, bool check_Ontap, String chi_event) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: check_Ontap ? green : white),
      child: Center(
        child: Text(
          chi_event,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget historyPlay(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          goi.length,
          (index) => Card(
            color: bg2,
            child: Container(
              padding: EdgeInsets.only(left: 10),
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
                          color: Color.fromARGB(255, 42, 226, 171),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.history_toggle_off_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goi[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1p30',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(
                        top: 10, right: 20, left: 20, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 61, 94, 238),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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

  @override
  Widget rank(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: goi.length,
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(5),
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 61, 94, 238),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      '${goi[index]}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
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
                          color: Color.fromARGB(255, 76, 129, 241),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Row(
                              children: [
                                const SizedBox(width: 30,),
                                Text('${index + 1}.',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18)),
                                CircleAvatar(),
                                Text('Phong',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18,color: white))
                              ],
                            ),
                           Row(
                            children: [ Text('100',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18,color: white),),
                                const SizedBox(width: 30,),
                            ],
                           )
                            
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          color: Color.fromARGB(255, 212, 86, 185),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('100+.',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18)),                      
                            Row(
                              
                              children: [
                                
                                Container(
                                  height: 70,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 76, 129, 241),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                ),
                                SizedBox(width: 5,),
                                
                              ],
                            ),
                           Row(
                            children: [ Text('100',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18,color: white),),
                                const SizedBox(width: 30,),
                            ],
                           )
                            
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
        ],
      ),
    );
  }
}
