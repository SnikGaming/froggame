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
    var IDdoc;
    var _table = FirebaseFirestore.instance.collection("packageQuestions");
    await _table
        .where("idUser", isEqualTo: "1")
        .where("idlv", isEqualTo: index)
        .get()
        .then(((value) {
      print("================================ID Doc ====${IDdoc}");
      value.docs.forEach((element) {
        print("${element.data()['idch']}");
        print("${element.data()['idlv']}");
        print("${element.data()['timer']}");
        print("${element.data()['idgoi']}");

        // score = element.data()['score'];
        // heart = element.data()['heart'];
        // UserSimplePreferences.setUserId(id: element.data()['userId']);
        // isId = true;
        // print("==1111111111111111===>  ${element.data()['score']}");
        // print("=====>  ${element.data()['name']}");
        // print("=====>  ${element.data()['email']}");
      });
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
