// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:froggame/models/friend_model.dart';
import 'package:intl/intl.dart';

import 'package:froggame/view_data/user_pre.dart';

class AddFriend {
  static final now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd -- H-m-s');
  static final String formatted = formatter.format(now);

  static final friend = FirebaseFirestore.instance.collection("friends");

  static List<FriendModel> lsAddFriend = [];
  static List<FriendModel> lsFriend = [];

  // Future<void> addUserToFireStore(FriendModel friendModel) async {
  //   return await _addfriendCollection
  //       .doc(friendModel.userId)
  //       .set(friendModel.toJson());
  // }

  // ignore: non_constant_identifier_names
  static Save(
      {required String idfriend,
      required String friendname,
      required String emailfriend,
      required String picfriend}) async {
    final addfriend1 = FirebaseFirestore.instance
        .collection("friends")
        .doc(UserSimplePreferences.getUserId());
    await addfriend1.set({
      //"avatar": UserSimplePreferences.getAvatar(),
      "iduser": idfriend,
      "emailfriend": UserSimplePreferences.getUserEmail(),
      "name": friendname,
      //"nameIg": UserSimplePreferences.getName(),
      "pic": UserSimplePreferences.getUserPic(),
      "idfriend": UserSimplePreferences.getUserId(),
      "friendname": UserSimplePreferences.getUsername(),
      "status": 0,
    });

    final addfriend2 =
        FirebaseFirestore.instance.collection("friends").doc(idfriend);
    await addfriend2.set({
      //"avatar": UserSimplePreferences.getAvatar(),
      "iduser": UserSimplePreferences.getUserId(),
      "emailfriend": emailfriend,
      "name": UserSimplePreferences.getUsername(),
      //"nameIg": UserSimplePreferences.getName(),
      "pic": picfriend,
      "idfriend": idfriend,
      "friendname": friendname,
      "status": 0,
    });
  }

  static getAddFriend(String iduser) async {
    lsAddFriend = [];
    await friend
        .where("iduser", isEqualTo: iduser)
        .where("status", isEqualTo: 0)
        .get()
        .then((value) {
      // ignore: unused_local_variable
      for (var val in value.docs) {
        lsAddFriend.add(FriendModel(
            userId: val.data()["iduser"],
            email: val.data()["emailfriend"],
            name: val.data()["name"],
            pic: val.data()["pic"],
            idfriend: val.data()["idfriend"],
            friendname: val.data()["friendname"],
            status: val.data()["status"]));
      }
    });
  }

  static getFriend(String iduser) async {
    lsFriend = [];
    await friend
        .where("iduser", isEqualTo: iduser)
        .where("status", isEqualTo: 1)
        .get()
        .then((value) {
      // ignore: unused_local_variable
      for (var val in value.docs) {
        lsFriend.add(FriendModel(
            userId: val.data()["iduser"],
            email: val.data()["emailfriend"],
            name: val.data()["name"],
            pic: val.data()["pic"],
            idfriend: val.data()["idfriend"],
            friendname: val.data()["friendname"],
            status: val.data()["status"]));
      }
    });
  }

  static acceptFriend(String idfriend) async {
    await friend.doc(idfriend).update({"status": 1});
    await friend.doc(UserSimplePreferences.getUserId()).update({"status": 1});
  }

  static refuseFriend(String idfriend) async {
    await friend.doc(idfriend).update({"status": 2});
  }
}

// static getAddFriendAll() async {
//     final getfriend = FirebaseFirestore.instance.collection("friend").doc();
//     await getfriend.get().then((value) {
//       for (var val in value) {
//         lsAddFriendAll.add(FriendModel(
//            // avatar: val.data()["avatar"],
//             userId: val.data()["userId"],
//             email: val.data()["email"],
//             name: val.data()["name"],
//            // nameIg: val.data()["nameIg"],
//             pic: val.data()["pic"],
//             idfriend: val.data()["idfriend"],
//             friendname: val.data()["friendname"],
//             status: val.data()["status"]));
//       }
//     });
//   }