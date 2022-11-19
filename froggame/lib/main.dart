import 'package:flutter/material.dart';
import 'package:froggame/screens/history/info.dart';
import 'package:froggame/screens/history/play_history.dart';

import 'screens/login/login_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const infomation_screen(),
      theme: ThemeData(fontFamily: "quick"),
    );
  }
}
