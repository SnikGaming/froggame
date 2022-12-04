import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../models/user_model.dart';

class FureStoreUser {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson());
  }

  static Future addDataUser({required heart, required score}) async {
    UserSimplePreferences.setHeart(heart: heart);
    UserSimplePreferences.setScore(score: score);

    print("ID -------------------->${UserSimplePreferences.getUserId()}");
    _userCollection.doc(UserSimplePreferences.getUserId()).update({
      "userId": UserSimplePreferences.getUserId(),
      "name": UserSimplePreferences.getUsername(),
      "pic": UserSimplePreferences.getUserPic(),
      "heart": UserSimplePreferences.getHeart(),
      "email": UserSimplePreferences.getUserEmail(),
      "score": UserSimplePreferences.getScore()
    });
  }
}
