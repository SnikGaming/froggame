import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  await FutureRank.getData();
  //await FutureHistory.getData();
  await FureStoreQuestions.getLenght();
  await FureStoreUser.getUserAll();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "basic_channel",
      channelName: "BasicChannel",
      channelDescription: "Notification for test channel",
      defaultColor: Colors.red,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      ledColor: Colors.white,
    ),
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "basic_channel", channelGroupName: 'basic group')
  ]);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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
