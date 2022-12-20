import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/questions_model.dart';

class DataPackageBattle {
  static List<QuestionModel> lsQuestion = [];
  static CreateQuestion() async {
    lsQuestion = [];
    await FirebaseFirestore.instance
        .collection("questions")
        .get()
        .then((value) {
      for (var a in value.docs) {
        lsQuestion.add(QuestionModel(
            cauhoi: a.data()['name'],
            a: a.data()['a'],
            b: a.data()['b'],
            c: a.data()['c'],
            d: a.data()['d']));
      }
    });
    lsQuestion.shuffle();
  }

  static CreateDataQuestionBattle(
      {required String id, required String idUser, String? idFriend}) {
    FirebaseFirestore.instance
        .collection("lobby")
        .doc(id)
        .set({'id': id, 'idUser': idUser, 'idFriend': idFriend});
    for (int i = 0; i < 30; i++) {
      FirebaseFirestore.instance
          .collection("battleQuestion")
          .doc("${id}${i + 1}")
          .set({
        'idphong': id,
        'question': lsQuestion[i].cauhoi,
        'a': lsQuestion[i].a,
        'b': lsQuestion[i].b,
        'c': lsQuestion[i].c,
        'd': lsQuestion[i].d,
        'idCau': i + 1,
      });
    }
  }

  static Future<List<QuestionModel>> getAllQuestionBattle(
      {required String id}) async {
    List<QuestionModel> result = [];
    await FirebaseFirestore.instance
        .collection("battleQuestion")
        .where('idphong', isEqualTo: id)
        .get()
        .then((value) {
      for (var a in value.docs) {
        result.add(QuestionModel(
            cauhoi: a.data()['question'],
            a: a.data()['a'],
            b: a.data()['b'],
            c: a.data()['c'],
            d: a.data()['d']));
      }
    });
    return result;
  }
}
