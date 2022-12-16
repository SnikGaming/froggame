// ignore_for_file: file_names, avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/packege_questions_model.dart';

class FureStorePackageQuestions {
  static final CollectionReference _table =
      FirebaseFirestore.instance.collection("packageQuestions");
  static final table = _table;

  Future<void> add(PackageQuestionModel model) async {
    return await _table.doc(model.idUser).set(model.toJson());
  }


}
