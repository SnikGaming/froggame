// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/view_data/user_pre.dart';

class FireStoredetailpack {
  static saveData(
      {required String tOrf,
      required int timer,
      required String chucnang,
      required int idlv,
      required String cautraloi,
      required String cautldung,
      required int causo,
      required String cauhoi}) async {
    String id = "${UserSimplePreferences.getUserId()}${idlv}${causo}";
    await FirebaseFirestore.instance.collection("detailpack").doc(id).set({
      'id': id,
      'idUser': UserSimplePreferences.getUserId(),
      'idlv': idlv,
      'causo': causo,
      'cauhoi': cauhoi,
      'cautraloi': cautraloi,
      'cautrldung': cautldung,
      'chucnang': chucnang,
      'timer': timer,
      'tOrf': tOrf
    });
  }
}
