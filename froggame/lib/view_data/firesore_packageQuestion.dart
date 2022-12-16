// ignore_for_file: file_names, avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/packege_questions_model.dart';

class FureStorePackageQuestions {
  static final CollectionReference _table =
      FirebaseFirestore.instance.collection("packageQuestions");
  static final table = _table;

  Future<void> add(PackageQuestionModel model) async {
    return await _table.doc(model.idUser).set(model.toJson());
  }

  static Future update({required int index}) async {
    // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
    // ignore: no_leading_underscores_for_local_identifiers
    var _table = FirebaseFirestore.instance.collection("packageQuestions");
    await _table
        .where("idUser", isEqualTo: "1")
        .where("idlv", isEqualTo: index)
        .get()
        // ignore: duplicate_ignore, duplicate_ignore
        .then(((value) {
      // ignore: avoid_print, unnecessary_brace_in_string_interps
      //print("================================ID Doc ====${IDdoc}");
      // ignore: unused_local_variable
      for (var element in value.docs) {
        // ignore: avoid_print
        // print("${element.data()['idch']}");
        // ignore: avoid_print
        //print("${element.data()['idlv']}");
        //print("${element.data()['timer']}");
        //print("${element.data()['idgoi']}");

        // score = element.data()['score'];
        // heart = element.data()['heart'];
        // UserSimplePreferences.setUserId(id: element.data()['userId']);
        // isId = true;
        // print("==1111111111111111===>  ${element.data()['score']}");
        // print("=====>  ${element.data()['name']}");
        // print("=====>  ${element.data()['email']}");
      }
    }));

    // UserSimplePreferences.setHeart(heart: heart);
    // UserSimplePreferences.setScore(score: score);

    // print("ID -------------------->${UserSimplePreferences.getUserId()}");
    // _table.doc(UserSimplePreferences.getUserId()).update({
    //   "userId": UserSimplePreferences.getUserId(),
    //   "name": UserSimplePreferences.getUsername(),
    //   "pic": UserSimplePreferences.getUserPic(),
    //   "heart": UserSimplePreferences.getHeart(),
    //   "email": UserSimplePreferences.getUserEmail(),
    //   "score": UserSimplePreferences.getScore()
    // });
  }
}
