import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';
import 'firestore_user.dart';

class AuthMethod {
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignInAccount? account;
  static String nameUser = "";
  static String phtoUser = "";

  String urlIMG = "https://media.giphy.com/media/CPO9ZmnEiDcdLXMrzv/giphy.gif",
      name = "No name";
  //! Dang nhap
  void googleSignInMethod() async {
    account = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await account!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth
        .signInWithCredential(credential)
        .then((value) => SaveUser(value));
    nameUser = account!.displayName.toString();
    phtoUser = account!.photoUrl.toString();
  }

  static void googleSignOutMethod() async {
    await googleSignIn.signOut().then((value) => exit(1));
  }

  // bool IsData(UserCredential user) {
  //   var documentStream = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.user!.uid)
  //       .snapshots();
  //   if (documentStream != null) {
  //     return true;
  //   }
  //   return false;
  // }

  void SaveUser(UserCredential user) async {
    final user_firebase = FirebaseFirestore.instance.collection('users');
    int score = 5;
    // var data = IsData(user);
    // var usId = FirebaseFirestore.instance
    //     .collection('users')
    //     .where("userId", isEqualTo: "B5xHd34qE4TrcloKFZXSA48U7mz2")
    //     .get();
    // print("\n\n\n======>${usId}======");
    // var data = FirebaseFirestore.instance
    //     .collection("users")
    //     .where("userId", isEqualTo: "B5xHd34qE4TrcloKFZXSA48U7mz2")
    //     .snapshots()
    //     .map((event) =>
    //         event.docs.map((e) => UserModel.fromJson(e.data())).toList());
    await user_firebase
        .where("userId", isEqualTo: user.user!.uid)
        .get()
        .then(((value) {
      value.docs.forEach((element) {
        score = element.data()['score'];
        print("=====>  ${element.data()['score']}");
        print("=====>  ${element.data()['name']}");
        print("=====>  ${element.data()['email']}");
      });
    }));
    await FureStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email!,
        name: user.user!.displayName! ?? name,
        pic: user.user!.photoURL! ?? urlIMG,
        score: score));
  }
}
