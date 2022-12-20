import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:froggame/screens/categories/category_question.dart';
import 'package:froggame/screens/gameplay/menu_screen.dart';
import 'package:froggame/screens/gameplay/game_play_screen.dart';
import 'package:froggame/screens/gameplay/quizz_screen.dart';
import 'package:froggame/screens/login/login_page.dart';
import 'package:froggame/view_data/firesore_questions.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:froggame/view_data/firestore_rank.dart';
import 'package:froggame/view_data/firestore_user.dart';
import 'package:froggame/view_data/mp3SimplePre.dart';
import 'package:froggame/view_data/setting_pref.dart';
import 'package:froggame/view_data/user_pre.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await SettingSimplePreferences.init();
  await UserSimplePreferences.init();
  await Mp3Simple.init();
  await FureStoreCategory.GetData();
  FureStoreCategory.getAllData();
  //await FutureRank.getData();
  await FutureRank.getAllData(1, UserSimplePreferences.getUserId());
  await FureStoreQuestions.getLenght();
  await FureStoreUser.getUserAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'welcome': (_) => const SiginPage(),
        'welcome2': (_) => const QuizzHome(),
        'gameplay': (_) => const QuizzScreen(),
        'quizz_screen': ((context) => QuizzGameScreen(idlv: 1)),
        'categories': ((context) => const TypeQuestionPage())
      },
      initialRoute: UserSimplePreferences.getUserId() == null ||
              UserSimplePreferences.getUserId() == ""
          ? 'welcome'
          //  : "quizz_screen",
          : 'welcome2',
      theme: ThemeData(fontFamily: "quick"),
    );
  }
}
