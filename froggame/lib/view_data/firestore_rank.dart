import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:froggame/models/rank_model.dart';
import 'package:froggame/screens/history/info.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:froggame/view_data/firestore_user.dart';

class FutureRank {
  static int id = 1;

  static List<rankModels> lstRank = [];

  static Future getData() async {
    String tempPic = '';
    var usAvatar = FirebaseFirestore.instance.collection('users');

    var _rankData = FirebaseFirestore.instance.collection('packageQuestions');
    // .orderBy('cautldung');
    //
    await _rankData.get().then((value) => {
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
                  print(
                      '============= Test ===============${r.data()['name']} ${r.data()['cautldung']} ${r.data()['idlv']}'),
                },
            },
          print('object'),
        });
  }
}
