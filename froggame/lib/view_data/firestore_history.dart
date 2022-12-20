import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/pack_detail_model.dart';

class FutureHistory {
  static List<PackDetail> lstPackage = [];

  static Future getAllDataPack(int idlv) async {
    lstPackage = [];
    var package = FirebaseFirestore.instance.collection('detailpack');


    await package.where('idlv', isEqualTo: idlv + 1).get().then(
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
<<<<<<< HEAD
                // ignore: avoid_print
                print(
                    '================== status =======================>> ${lstPackage[0].status}'),
=======
>>>>>>> 9b3af3070ccaaf1076dd342e0336e7042e7d753a
              },
          },
        );
  }
}
