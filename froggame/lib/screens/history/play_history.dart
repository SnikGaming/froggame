import 'package:flutter/material.dart';
import 'package:froggame/const/colors.dart';

// ignore: camel_case_types
class playHistory extends StatefulWidget {
  const playHistory({super.key});

  @override
  State<playHistory> createState() => _playHistoryState();
}

// ignore: camel_case_types
class _playHistoryState extends State<playHistory> {
  List<String> goi = ['lịch sử', 'Khoa học', 'Địa lí', 'Toán học', 'Văn học'];
  // ignore: non_constant_identifier_names
  List<String> Ten = ['Phong', 'Long', 'Quân'];
  // ignore: non_constant_identifier_names
  List<int> Diem = [100, 150, 200];
  @override
  Widget build(BuildContext context) {
    final si = MediaQuery.of(context).size;
    return Scaffold(
        body: DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
          Icon(
            Icons.info_outline_rounded,
            color: Colors.yellow,
          ),
          Text(
            'Thông tin',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 10, 10, 10),
            ),
          ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.work_history_outlined,
                      size: 25,
                      color: Color.fromARGB(255, 69, 92, 223),
                    ),
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.rate_review_outlined,
                      size: 25,
                      color: Color.fromARGB(255, 69, 92, 223),
                    ),
                    Text(
                      'Rank',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 2, 2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [        
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: goi.length,
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(5),
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 61, 94, 238),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              goi[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: si.height * .03,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 38,
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: const Text(
                              'Xếp hạng',
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 38 + 130,
                          // ignore: avoid_unnecessary_containers
                          child: Container(child: const Text('Tên')),
                        ),
                        const Positioned(
                          right: 70 - 5,
                          child: Text('Điểm'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: 376,
                      decoration: BoxDecoration(
                          color: bg2,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('${index + 1}'),
                                  Text(Ten[index]),
                                  Text('${Diem[index]}')
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
