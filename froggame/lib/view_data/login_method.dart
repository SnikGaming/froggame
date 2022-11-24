import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/screens/gameplay/options_screen.dart';
import 'package:froggame/screens/login/login_page.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import 'firestore_user.dart';

class AuthMethod {
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignInAccount? account;
  // isLogin() async {
  //   return _auth.currentUser;
  // }

  String urlIMG = "https://media.giphy.com/media/CPO9ZmnEiDcdLXMrzv/giphy.gif",
      name = "No name";
  //! Dang nhap
  void googleSignInMethod(context) async {
    account = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await account!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth
        .signInWithCredential(credential)
        .then((value) => SaveUser(value));
    // nameUser = account!.displayName.toString();
    // phtoUser = account!.photoUrl.toString();
    // idUser = account!.id.toString();
    // print(idUser);
    UserSimplePreferences.setUserId(id: account!.id);
    UserSimplePreferences.setUserPic(pic: account!.photoUrl.toString());
    UserSimplePreferences.setUsername(
        username: account!.displayName.toString());
    //nextScreen(context, const QuizzHome());
    pushNamedRemove(context, 'welcome2');
  }

  static googleSignOutMethod(context) async {
    await googleSignIn.signOut().then((value) {
      //nextScreen(context, const SiginPage());
      pushNamedRemove(context, "welcome");
      UserSimplePreferences.removeAll();
    });
  }

  void SaveUser(UserCredential user) async {
    final user_firebase = FirebaseFirestore.instance.collection('users');
    int score = 0;
    int heart = 5;
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
        heart = element.data()['heart'];
        print("=====>  ${element.data()['score']}");
        print("=====>  ${element.data()['name']}");
        print("=====>  ${element.data()['email']}");
      });
    }));
    await FureStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email!,
        name: user.user!.displayName!,
        pic: user.user!.photoURL!,
        heart: heart,
        score: score));
    UserSimplePreferences.setScore(score: score);
    UserSimplePreferences.setUserId(id: user.user!.uid);
    print("=============================${UserSimplePreferences.getUserId()}");
    UserSimplePreferences.setHeart(heart: heart);
  }
}
