import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/const/str_Type.dart';
import 'package:froggame/models/pack_detail_model.dart';
import 'package:froggame/view_data/user_pre.dart';

class FutureHistory {
  static List<PackDetail> lstPackage = [];

  static Future getAllDataPack(int idlv, String iduser) async {
    lstPackage = [];
    int score = 0;
    var package = FirebaseFirestore.instance.collection('detailpack');

    List<String> lstAvatar = [];

    await package
        .where('idlv', isEqualTo: idlv + 1)
        .where('idUser', isEqualTo: iduser)
        .get()
        .then(
          (value) => {
            for (var p in value.docs)
              {
                lstPackage.add(
                  PackDetail(
                    time: p.data()['timer'],
                    question: p.data()['cauhoi'],
                    answerText: p.data()['cautraloi'],
                    status: p.data()['tOrf'],
                  ),
                ),
              },
          },
        );
  }
}
