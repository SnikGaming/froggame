import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  bool checkFooter = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ScrollOnExpand(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: index % 2 == 0 ? Colors.green : Colors.red)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expandable(
                          collapsed: _addHeader(context, false),
                          // _addHeader(context, false, lstHistory, index),
                          expanded: _addHeader(context, true),
                          // _addHeader(context, true, lstHistory, index)
                          //_addHeader(context, false),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Builder(
                              builder: (context) {
                                var controller = ExpandableController.of(
                                    context,
                                    required: true)!;
                                return Padding(
                                  padding: EdgeInsets.only(left: 230),
                                  child: ElevatedButton(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      width: size.width * 0.2,
                                      child: Center(
                                        child: Text(
                                          controller.expanded
                                              ? "Đóng"
                                              : "Chi tiết",
                                          style: Theme.of(context)
                                              .textTheme
                                              .button!
                                              .copyWith(
                                                  color: Color.fromARGB(
                                                      255, 243, 243, 245),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        checkFooter = controller.expanded;
                                      });
                                      controller.toggle();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }

  @override
  Widget _addHeader(BuildContext context, bool chkToggle) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Kết quả',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(),
                ),
                Container(
                  child: Text(
                    'vs',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            height: 5,
          ),
          chkToggle ? _addFooter(context) : Container(),
        ],
      ),
    );
  }

  @override
  Widget _addFooter(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Thời gian',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('10',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              Text('10',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
