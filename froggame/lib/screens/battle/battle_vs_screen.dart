import 'package:flutter/material.dart';

class BattleVsScreen extends StatefulWidget {
  const BattleVsScreen({super.key});

  @override
  State<BattleVsScreen> createState() => _BattleVsScreenState();
}

class _BattleVsScreenState extends State<BattleVsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 62, 10, 117),
                Color.fromARGB(228, 233, 30, 98)
              ],
            ),
          ),
          child: Column(
            children: const <Widget>[
             
           
            ],
          ),
        ),
      ),
    );
  }
}
