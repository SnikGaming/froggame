import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../../view_data/firestore_categories.dart';

class profileData {
  static List<int> data = [];
  static final lengData = FureStoreCategory.lsData.length;
  static final _data = FirebaseFirestore.instance
      .collection("packageQuestions")
      .where("idUser", isEqualTo: UserSimplePreferences.getUserId().toString());
  static getAllData() async {
    for (int i = 0; i < lengData; i++) {
      await _data.where("idlv", isEqualTo: i + 1).get().then((value) {
        for (var j in value.docs) {
          data.add(j.data()['cautldung']);
          print("----->>>>DATA<<<<<------${data}");
        }
      });
    }
    print("----->>>>DATA<<<<<------${data.length}");
  }
}
