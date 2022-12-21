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
      'User1Status': null,
      'User2Status': null
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
            user1status: val.data()['User1Status'],
            user2status: val.data()['User2Status']));
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

  static updateStatusLobby(String id, String user1status, String user2status) {
    FirebaseFirestore.instance
        .collection("lobby")
        .doc(id)
        .update({"User1Status": user1status, "User2Status": user2status});
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
