import 'package:flutter/material.dart';

const blue = Color.fromARGB(255, 32, 67, 224);
const darkBlue = Color(0xff3442af);
const bgColor = Color(0xffe4ecfa);
const lightgrey = Color(0xffb8c6e6);
const white = Colors.white;
const yellow = Colors.yellowAccent;
const red = Colors.red;
const green = Colors.green;
const purple = Colors.purple;

const bg1 = Color.fromARGB(183, 122, 47, 214);
const bg2 = Color.fromARGB(176, 54, 185, 233);

var lsColor = [
  Colors.red.shade300,
  Colors.purple.shade300,
  Colors.yellowAccent,
  Colors.green.shade300,
  Colors.pink.shade300,
  Colors.blueAccent.shade200,
  Colors.grey.shade300,
  Color.fromARGB(255, 218, 41, 41),
  Color.fromARGB(255, 102, 230, 115)
];
const List<Color> list2 = [
  Color.fromARGB(255, 232, 162, 154),
  Color.fromARGB(255, 61, 76, 175),
  Color.fromARGB(255, 37, 16, 141),
  Color.fromARGB(255, 242, 66, 148),
  Color.fromARGB(255, 251, 195, 74)
];
LinearGradient linearGradient =
    const LinearGradient(colors: [bg1, bg2], begin: Alignment.topLeft);

// ignore: todo
//TODO : Color Main
LinearGradient background = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [bg1, bg2]);

// ignore: todo
//TODO : Color Text AnimatedText
final colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];
