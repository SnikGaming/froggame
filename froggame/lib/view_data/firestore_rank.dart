
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/rank_model.dart';

class FutureRank {
  static int id = 1;

  static List<rankModels> lstRank = [];

  static Future getData() async {
    String tempPic = '';
    var usAvatar = FirebaseFirestore.instance.collection('users');

    var rankData = FirebaseFirestore.instance.collection('packageQuestions');
    // .orderBy('cautldung');
    //
    await rankData.get().then((value) => {
          for (var r in value.docs)
            {
              if (r.data()['cautldung'] > 0)
                {
                  usAvatar
                      .where('userId', isEqualTo: r.data()['idUser'])
                      .get()
                      .then(
                        (value) => {
                          for (var u in value.docs)
                            {
                              tempPic = u.data()['pic'],
                              // ignore: avoid_print
                              print(
                                  '============= Test ===============${u.data()['pic']} }'),
                            },
                          lstRank.add(
                            rankModels(
                              avatar: tempPic,
                              idlv: r.data()['idlv'],
                              NamePlayer: r.data()['name'],
                              score: r.data()['cautldung'],
                            ),
                          ),
                        },
                      ),
                  // ignore: avoid_print
                  print(
                      '============= Test ===============${r.data()['name']} ${r.data()['cautldung']} ${r.data()['idlv']}'),
                },
            },
          // ignore: avoid_print
          print('object'),
        });
  }
}
