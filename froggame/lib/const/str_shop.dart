import 'package:flutter/material.dart';

class StrShop {
  static List<String> categories = [
    "Tất cả",
    "Khung",
    "Gói VIP",
  ];

  static final NoClcik = Colors.purple;
  static final Clcik = Color.fromARGB(255, 138, 33, 243);
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

  static Item() {
    return Container(
      child: Column(
        children: [
          //TODO :
          //TODO :
        ],
      ),
    );
  }
}

class ItemData {
  final img;
  final name;

  ItemData({required this.img, required this.name});
}
