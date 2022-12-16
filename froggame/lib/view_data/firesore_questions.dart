import 'package:cloud_firestore/cloud_firestore.dart';

class FureStoreQuestions {
  static final questions = FirebaseFirestore.instance.collection("questions");
  static final categories = FirebaseFirestore.instance.collection("categoties");

  static var lsData = [];
  static var lsDataLeng = [];
  static int _categories = 0;
  static var count = [];

  static getLenght() async {
    await categories.get().then((value) {
      for (var i in value.docs) {
        lsDataLeng.add(i.data()["id"]);
      }
      _categories = lsDataLeng.length;
    });
    for (var i = 0; i < _categories; i++) {
      await FirebaseFirestore.instance
          .collection('questions')
          .where("idlv", isEqualTo: i + 1)
          .get()
          .then((value) {
        for (var a in value.docs) {
          lsData.add(a.data()["id"]);
        }
      });
      count.add(lsData.length);
      lsData = [];
    }

    //!:
    // for (var i = 0; i < count.length; i++) {
    //   print("===============QWWWWWWWWWWWWWW${count[i]}");
    // }
  }
}
