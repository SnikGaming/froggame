import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/rank_model.dart';

class FutureRank {
  static List<rankModels> lstRank = [];

  static Future getAllData(int idlv) async {
    var rankValue = FirebaseFirestore.instance.collection('packageQuestions');

    lstRank = [];
    await rankValue.where('idlv', isEqualTo: idlv + 1).get().then(
          (value) => {
            lstRank = [],
            for (var r in value.docs)
              {
                lstRank.add(
                  rankModels(
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
