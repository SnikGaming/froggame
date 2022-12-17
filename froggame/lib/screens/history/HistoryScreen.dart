import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/models/category_model.dart';
import 'package:froggame/screens/history/info.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:froggame/view_data/firestore_history.dart';

import '../../const/colors.dart';
import '../../models/pack_detail_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FutureHistory.getAllDataPack(selectedPack);
    _loadData();
  }

  _loadData() async {
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
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: goi.length,
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
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          height: size.height * 0.631,
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
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: lstHistory[index].status == 'đúng'
                                    ? Colors.green
                                    : Colors.red)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expandable(
                                collapsed: _addHeader(
                                    context, false, lstHistory, index),
                                expanded:
                                    _addHeader(context, true, lstHistory, index)
                                //_addHeader(context, false),
                                ),
                            Divider(
                              height: 1,
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
      ],
    );
  }

  @override
  Widget _addHeader(
      BuildContext context, bool chkHiden, List<PackDetail> lst, int index) {
    return Container(
      child: Column(
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
                child: Image.network('${goi[selectedPack].img}'),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              RichText(
                text: TextSpan(
                  text: '${lstHistory[index].time}',
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 159, 61),
                      fontSize: 30,
                      fontFamily: 'DS-DIGITAL'),
                  children: [
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
                decoration: BoxDecoration(
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
                      '${lst[index].status}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          chkHiden ? _addFooter(lst, index) : Container(),
        ],
      ),
    );
  }

  _addFooter(List<PackDetail> lst, int index) {
    return Container(
      child: ListTile(
        title: RichText(
          text: TextSpan(
            text: 'Câu hỏi: ',
            style: F_pacifico.copyWith(
              color: Color.fromARGB(255, 6, 6, 230),
              fontSize: 30,
            ),
            children: [
              TextSpan(
                  text: '${lst[index].question} ?',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'quick',
                      fontWeight: FontWeight.w200)),
            ],
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: 'Câu trả lời của bạn: ',
            style: F_pacifico.copyWith(
              color: Color.fromARGB(255, 6, 6, 230),
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: ' ${lst[index].answerText} ',
                style: TextStyle(
                    fontSize: 18,
                    color:
                        lst[index].status == 'đúng' ? Colors.green : Colors.red,
                    fontFamily: 'quick',
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
