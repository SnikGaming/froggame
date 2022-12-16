import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:froggame/const/next_screen.dart';
// ignore: unused_import
import 'package:froggame/screens/gameplay/menu_screen.dart';
// ignore: unused_import
import 'package:froggame/screens/login/login_page.dart';
import 'package:froggame/view_data/package_method.dart';
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
    //UserSimplePreferences.setUserId(id: account!.id);
    UserSimplePreferences.setUserPic(pic: account!.photoUrl.toString());
    UserSimplePreferences.setUsername(
        username: account!.displayName.toString());
    //nextScreen(context, const QuizzHome());
    PackageMethod.InitPackage()
        .then((value) => pushNamedRemove(context, 'welcome2'));
  }

  static googleSignOutMethod(context) async {
    await googleSignIn.signOut().then((value) {
      //nextScreen(context, const SiginPage());
      UserSimplePreferences.removeUserId();
      UserSimplePreferences.removeAll();
      pushNamedRemove(context, "welcome");
    });
  }

  // ignore: non_constant_identifier_names
  void SaveUser(UserCredential user) async {
    // ignore: non_constant_identifier_names
    final user_firebase = FirebaseFirestore.instance.collection('users');
    int score = 0;
    int heart = 5;
    String nameIg = "";
    String avatar = "";
    bool isId = false;
    // ignore: todo
    //TODO: Thực hiện truy vấn lấy User theo uiser ID = UID
    await user_firebase
        .where("userId", isEqualTo: user.user!.uid)
        .get()
        .then(((value) {
      // ignore: avoid_function_literals_in_foreach_calls
      value.docs.forEach((element) {
        // ignore: todo
        //TODO: Lấy các giá trị của User X { Score Heart  }
        score = element.data()['score'];
        heart = element.data()['heart'];
        avatar = element.data()['avatar'];
        nameIg = element.data()['nameIg'];

        UserSimplePreferences.setUserId(id: element.data()['userId']);
        //!: Tồn tại trả về true
        //!: Không tồn tại giữ nguyên false
        isId = true;
      });
    }));
    // ignore: todo
    //TODO: Sau khi lấy ra nếu có thì sẽ Add
    await FureStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        email: user.user!.email!,
        name: user.user!.displayName!,
        pic: user.user!.photoURL!,
        heart: heart,
        score: score,
        nameIg: nameIg,
        avatar: avatar));
    //!: S
    if (!isId) {
      UserSimplePreferences.setUserId(id: user.user!.uid);
    }
    UserSimplePreferences.setScore(score: score);
    UserSimplePreferences.setUserEmail(email: user.user!.email!);
    UserSimplePreferences.setHeart(heart: heart);
    UserSimplePreferences.setAvatar(avatar: avatar);
    UserSimplePreferences.setName(name: nameIg);
  }
}
