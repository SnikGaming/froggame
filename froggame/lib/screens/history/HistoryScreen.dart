// ignore_for_file: file_names

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/models/category_model.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:froggame/view_data/firestore_history.dart';

import '../../models/pack_detail_model.dart';

class HistoryScreen extends StatefulWidget {
  int index = 0;
  HistoryScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    await FutureHistory.getAllDataPack(selectedPack);
    var _data = await FureStoreCategory.lsData;
    var _lstHistory = await FutureHistory.lstPackage;
    setState(() {});
    goi = _data;
    lstHistory = _lstHistory;
  }

  static List<PackDetail> lstHistory = [];
  static List<Category> goi = [];
  var selectedPack = 0;
  bool checkFooter = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: goi.length > 15 ? 10 : goi.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                selectedPack = index;
                await FutureHistory.getAllDataPack(selectedPack);
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
                    goi[index].name,
                    style: selectedPack == index
                        ? const TextStyle(
                            color: Color.fromARGB(255, 250, 248, 248),
                            fontSize: 20,
                            fontWeight: FontWeight.w500)
                        : const TextStyle(
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
        AnimatedCus(
          context: context,
          y: 120,
          chil: Container(
            height: size.height * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  lstHistory.length,
                  (index) => ExpandableNotifier(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: ScrollOnExpand(
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: lstHistory[index].status == '????ng'
                                      ? Colors.green
                                      : Colors.red)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expandable(
                                  collapsed: _addHeader(
                                      context, false, lstHistory, index),
                                  expanded: _addHeader(
                                      context, true, lstHistory, index)
                                  //_addHeader(context, false),
                                  ),
                              Divider(
                                thickness: 2,
                                height: 5,
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
                                                    ? "????ng"
                                                    : "Chi ti???t",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button!
                                                    .copyWith(
                                                        color: Color.fromARGB(
                                                            255, 243, 243, 245),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
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
          ),
        ),
      ],
    );
  }

  Widget _addHeader(
      BuildContext context, bool chkHiden, List<PackDetail> lst, int index) {
    return Column(
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
              child: Image.network(goi[selectedPack].img),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            RichText(
              text: TextSpan(
                text: '${lstHistory[index].time}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 159, 61),
                    fontSize: 30,
                    fontFamily: 'DS-DIGITAL'),
                children: const [
                  TextSpan(
                      text: ' s',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontFamily: 'quick',
                          fontWeight: FontWeight.w200)),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/button/btn_1/18.png'),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Icon(
                  //   Icons.star_rate_outlined,
                  //   color: Colors.yellow,
                  // ),
                  Text(
                    lst[index].status,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        chkHiden ? _addFooter(lst, index) : Container(),
      ],
    );
  }

  _addFooter(List<PackDetail> lst, int index) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          text: 'C??u h???i: ',
          style: F_pacifico.copyWith(
            color: const Color.fromARGB(255, 6, 6, 230),
            fontSize: 30,
          ),
          children: [
            TextSpan(
                text: '${lst[index].question} ?',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'quick',
                    fontWeight: FontWeight.w200)),
          ],
        ),
      ),
      subtitle: RichText(
        text: TextSpan(
          text: 'C??u tr??? l???i c???a b???n: ',
          style: F_pacifico.copyWith(
            color: const Color.fromARGB(255, 6, 6, 230),
            fontSize: 30,
          ),
          children: [
            TextSpan(
              text: ' ${lst[index].answerText} ',
              style: TextStyle(
                  fontSize: 18,
                  color:
                      lst[index].status == '????ng' ? Colors.green : Colors.red,
                  fontFamily: 'quick',
                  fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}
