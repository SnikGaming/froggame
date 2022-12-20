import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/rank_model.dart';
import 'package:froggame/models/scoreProfile.dart';

class FutureRank {
  static List<rankModels> lstRank = [];
  static List<Score> lstScore = [];

  static Future getScore(String iduser) async {
    lstScore = [];
    var rankValue = FirebaseFirestore.instance.collection('packageQuestions');
    await rankValue.where('idUser', isEqualTo: iduser).get().then(
          (value) => {
            for (var sc in value.docs)
              {
                lstScore.add(Score(
                    idlv: sc.data()['idlv'], score: sc.data()['cautldung'])),
              }
          },
        );
  }

  static Future getAllData(int idlv, String idUser) async {
    var rankValue = FirebaseFirestore.instance.collection('packageQuestions');

    lstRank = [];
    await rankValue.where('idlv', isEqualTo: idlv + 1).get().then(
          (value) => {
            lstRank = [],
            for (var r in value.docs)
              {
                lstRank.add(
                  rankModels(
                    iduser: r.data()['idUser'],
                    avatar: r.data()['pic'],
                    idlv: r.data()['idlv'],
                    NamePlayer: r.data()['name'],
                    score: r.data()['cautldung'],
                  ),
                ),
              },
          },
        );
  }
}
