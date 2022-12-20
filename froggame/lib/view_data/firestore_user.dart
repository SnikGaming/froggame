import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../models/user_model.dart';

class FureStoreUser {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");
  static List<UserModel> lsUserAll = [];
  static List<UserModel> lsUserSearch = [];
  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson());
  }

  static Future addDataUser({required heart, required score}) async {
    UserSimplePreferences.setHeart(heart: heart);
    UserSimplePreferences.setScore(score: score);

    // ignore: avoid_print
    //print("ID -------------------->${UserSimplePreferences.getUserId()}");
    _userCollection.doc(UserSimplePreferences.getUserId()).update({
      "userId": UserSimplePreferences.getUserId(),
      "name": UserSimplePreferences.getUsername(),
      "pic": UserSimplePreferences.getUserPic(),
      "heart": UserSimplePreferences.getHeart(),
      "email": UserSimplePreferences.getUserEmail(),
      "score": UserSimplePreferences.getScore(),
      'nameIg': UserSimplePreferences.getName(),
      'avatar': UserSimplePreferences.getAvatar(),
      'age': UserSimplePreferences.getNgaySinh(),
      'tokenMessage': UserSimplePreferences.getTokenMessage()
    });
  }

  static Future getAvatar(String userId) async {
    var usAvatar = FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: userId);
    await usAvatar.get().then(
          (value) => {},
        );
  }

  static getUserAll() async {
    lsUserAll = [];
    await FirebaseFirestore.instance.collection("users").get().then((value) {
      for (var val in value.docs) {
        lsUserAll.add(UserModel(
            userId: val.data()["userId"],
            email: val.data()["email"],
            name: val.data()["name"],
            pic: val.data()["pic"],
            tokenMessage: val.data()["tokenMessage"]));
      }
    });
  }

  static getUserSearch(String txt) async {
    lsUserSearch = [];
    for (int i = 0; i < lsUserAll.length; i++) {
      if (lsUserAll[i].name.toLowerCase().contains(txt.toLowerCase()) ||
          lsUserAll[i].email.toLowerCase().contains(txt.toLowerCase())) {
        lsUserSearch.add(lsUserAll[i]);
      }
    }
  }
}
