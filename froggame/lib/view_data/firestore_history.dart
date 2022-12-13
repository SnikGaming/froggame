import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/const/str_Type.dart';
import 'package:froggame/models/history_model.dart';
import 'package:froggame/view_data/user_pre.dart';

import 'firestore_categories.dart';

class FutureHistory {
  static List<lstHistory> lst = [];
  static List<int> idlv = [];
  static final hisData = FirebaseFirestore.instance
      .collection('packageQuestions')
      .where('name', isEqualTo: UserSimplePreferences.getUsername());

  static Future getData() async {
    List<String> catName = FureStoreCategory.lst;
    await await hisData.get().then(
          (value) => {
            for (var a in value.docs)
              {
                idlv.add(a.data()['idlv'] - 1),
                lst.add(lstHistory(
                    img: TypeModel.listType[a.data()['idlv'] - 1].image,
                    catName: catName[a.data()['idlv'] - 1],
                    timer: a.data()['timer'].toString(),
                    score: a.data()['cautldung'].toString())),
              },
          },
        );
  }
}
