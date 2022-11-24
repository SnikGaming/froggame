import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:froggame/screens/gameplay/options_screen.dart';
import 'package:froggame/screens/gameplay/quizz_screen.dart';
import 'package:froggame/screens/login/login_page.dart';
import 'package:froggame/view_data/setting_pref.dart';
import 'package:froggame/view_data/user_pre.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await SettingSimplePreferences.init();
  await UserSimplePreferences.init();
  runApp(MyApp());
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
      },
      initialRoute: UserSimplePreferences.getUserId() == null ||
              UserSimplePreferences.getUserId() == ""
          ? 'welcome'
          : 'welcome2',
      // home: UserSimplePreferences.getUserId() == null ||
      //         UserSimplePreferences.getUserId() == ""
      //     ? const SiginPage()
      //     : const QuizzHome(),
      theme: ThemeData(fontFamily: "quick"),
    );
  }
}
