import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/screens/history/info.dart';

import '../../const/colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var goi = ['khoa học', 'IT'];
  var selectedPack = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedPack = index;
                });
              },
              child: Container(
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedPack == index
                            ? AssetImage('assets/button/btn_1/7.png')
                            : AssetImage('assets/button/btn_1/9.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    '${goi[index]}',
                    style: selectedPack == index
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
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          height: size.height * 0.6,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                10,
                (index) => Card(
                  color: bg2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 42, 226, 171),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(child: CircleAvatar()),
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Thời Gian',
                                    style: F_pacifico.copyWith(
                                        fontSize: 27,
                                        color: white,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/button/btn_1/18.png'),
                                      fit: BoxFit.cover)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star_rate_outlined,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    '100',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: ListTile(
                            title: Text(
                              'Câu hỏi',
                              style: F_pacifico.copyWith(
                                  fontSize: 25,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              'Câu trả lời đúng',
                              style: F_pacifico.copyWith(
                                  fontSize: 25,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
