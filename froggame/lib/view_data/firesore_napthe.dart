// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:froggame/view_data/user_pre.dart';

class NapThe {
  static final now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd -- H-m-s');
  static final String formatted = formatter.format(now);
  // ignore: non_constant_identifier_names
  static Save({required int menhgia}) async {
    final napthe = FirebaseFirestore.instance.collection("napthe").doc();
    await napthe.set({
      "iduser": UserSimplePreferences.getUserId(),
      "name": UserSimplePreferences.getUsername(),
      "menhgia": menhgia,
      "napluc": formatted.toString()
    });
  }
}
