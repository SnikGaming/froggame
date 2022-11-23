import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FureStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson());
  }
}
