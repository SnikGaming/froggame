import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:froggame/view_data/firesore_packageQuestion.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../screens/gameplay/quizz_game_screen.dart';

class PackageMethod {
  // ignore: prefer_final_fields
  static String _idgoi = UserSimplePreferences.getUserId();
  static int idlv = 0, idch = 0, timer = 0;
  static String idUser = _idgoi;
  static String idgoi = _idgoi;
  static bool isData = true;
  static var docPakage =
      FirebaseFirestore.instance.collection("packageQuestions");
  static bool isLoad = false;
  static Future createPackage({required index, context}) async {
    await docPakage
        // ignore: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps
        .where('idgoi', isEqualTo: _idgoi + "${index}")
        .get()
        .then(((value) {
      // ignore: avoid_function_literals_in_foreach_calls
      value.docs.forEach((element) async {
        // ignore: avoid_print
        print("==1111111111111111===>  ${element.data()['idgoi']}");
        idgoi = "${element.data()['idgoi']}";
        idUser = "${element.data()['idUser']}";
        idlv = int.parse("${element.data()['idlv']}");
        idch = int.parse("${element.data()['idch']}");
        timer = int.parse("${element.data()['timer']}");
        // ignore: avoid_print
        print("==1111111111111111===>  $idch");
        UserSimplePreferences.setSL(index: idch);

        isData = false;
        isLoad = true;
      });
    }));
    // ignore: todo
    //TODO: Them goi neu lan dau bam vao
    if (isData) {
      // ignore: no_leading_underscores_for_local_identifiers
      final _docPakage = FirebaseFirestore.instance
          .collection("packageQuestions")
          // ignore: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps
          .doc(_idgoi + "${index}");
      await _docPakage.set({
        // ignore: prefer_interpolation_to_compose_strings
        'idgoi': _idgoi + "$index",
        'idch': idch,
        'timer': 0,
        'idlv': index,
        'idUser': _idgoi
      });
      isLoad = true;
    }
  }

  // ignore: non_constant_identifier_names
  static Future UpatePackage(
      {required int currentIndex, required int index}) async {
    UserSimplePreferences.setSL(index: currentIndex);
    // ignore: prefer_interpolation_to_compose_strings
    await docPakage.doc(_idgoi + "$index").update({
      'idgoi': "$_idgoi$index",
      'idch': UserSimplePreferences.getSL(),
      'timer': 0,
      'idlv': index,
      'idUser': _idgoi
    });
  }
}
