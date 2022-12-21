// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/lobby_model.dart';
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
    FirebaseFirestore.instance.collection("lobby").doc(id).set({
      'id': id,
      'User1': idUser,
      'User2': idFriend,
      'User1Score': null,
      'User2Score': null
    });
    for (int i = 0; i < 30; i++) {
      FirebaseFirestore.instance
          .collection("battleQuestion")
          .doc("$id${i + 1}")
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

  static List<LobbyModel> listLobby() {
    List<LobbyModel> lsLobby = [];
    FirebaseFirestore.instance.collection("lobby").get().then((value) {
      for (var val in value.docs) {
        lsLobby.add(LobbyModel(
            id: val.data()['id'],
            user1: val.data()['User1'],
            user2: val.data()['User2'],
            user1score: val.data()['User1Score'],
            user2score: val.data()['User2Score']));
      }
    });
    return lsLobby;
  }

  static user2Join(String id, String iduser) {
    FirebaseFirestore.instance
        .collection("lobby")
        .doc(id)
        .update({"User2": iduser});
  }

  static updateUser1Score(String id, int user1score) {
    FirebaseFirestore.instance
        .collection("lobby")
        .doc(id)
        .update({"User1Score": user1score});
  }

  static updateUser2Score(String id, int user2score) {
    FirebaseFirestore.instance
        .collection("lobby")
        .doc(id)
        .update({"User2Score": user2score});
  }

  static loadDataUser2({required id}) {
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
