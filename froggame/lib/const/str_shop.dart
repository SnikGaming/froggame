import 'package:flutter/material.dart';

class StrShop {
  static List<String> categories = [
    "Tim",
    "Nạp",
  ];

  // ignore: constant_identifier_names
  static const NoClcik = Colors.purple;
  // ignore: constant_identifier_names
  static const Clcik = Color.fromARGB(255, 138, 33, 243);
  static final lsColor = [
    Colors.red.shade300,
    Colors.purple.shade300,
    Colors.yellowAccent,
    Colors.green.shade300,
    Colors.pink.shade300,
  ];
  static List<ItemData> lstData = [
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
    ItemData(img: "", name: ""),
  ];

  // ignore: non_constant_identifier_names
  static Item() {
    return Column(
      children: const [
        // ignore: todo
        //TODO :
        // ignore: todo
        //TODO :
      ],
    );
  }
}

class ItemData {
  // ignore: prefer_typing_uninitialized_variables
  final img;
  // ignore: prefer_typing_uninitialized_variables
  final name;

  ItemData({required this.img, required this.name});
}
