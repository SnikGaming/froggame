import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:froggame/screens/categories/category_question.dart';
import 'package:froggame/screens/gameplay/menu_screen.dart';
import 'package:froggame/screens/gameplay/game_play_screen.dart';
import 'package:froggame/screens/gameplay/quizz_screen.dart';
import 'package:froggame/screens/login/login_page.dart';
import 'package:froggame/view_data/data_PackBattle.dart';
import 'package:froggame/view_data/firesore_questions.dart';
import 'package:froggame/view_data/firestore_categories.dart';
import 'package:froggame/view_data/firestore_rank.dart';
import 'package:froggame/view_data/firestore_user.dart';
import 'package:froggame/view_data/mp3SimplePre.dart';
import 'package:froggame/view_data/setting_pref.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    //'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

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
  DataPackageBattle.listLobby();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const MaterialColor blue2 = MaterialColor(
    0xFF509A77,
    <int, Color>{
      50: Color(0xFFE1FCEF),
      100: Color(0xFFBCFDDF),
      200: Color(0xFF8EFAC7),
      300: Color(0xFF63F6B1),
      400: Color(0xFF42F5A0),
      500: Color(0xFF509A77),
      600: Color(0xFF1DE586),
      700: Color(0xFF18D079),
      800: Color(0xFF14BD6D),
      900: Color(0xFF0CA05A),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'welcome': (_) => const SiginPage(),
        'welcome2': (_) => QuizzHome(),
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
