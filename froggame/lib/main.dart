import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:froggame/screens/gameplay/options_screen.dart';
import 'package:froggame/screens/login/login_page.dart';
import 'package:froggame/view_data/user_pre.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await UserSimplePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserSimplePreferences.getUserId() == null ||
              UserSimplePreferences.getUserId() == ""
          ? const SiginPage()
          : const QuizzHome(),
      theme: ThemeData(fontFamily: "quick"),
    );
  }
}
