import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/view_data/user_pre.dart';

class PackBattle {
  static Future<void> createData({required String id}) async {
    await FirebaseFirestore.instance
        .collection("")
        .doc("${id}+${UserSimplePreferences.getUserId()}")
        .set({
          'id':id,
          'idUser':UserSimplePreferences.getUsername(),
          
        });
  }
}
