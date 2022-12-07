import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var link = "https://opentdb.com/api.php?amount=20";

getQuiz() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    // ignore: avoid_print
    print("data is loaded");

    return data;
  } else {
    // ignore: avoid_print
    print(
        "------------------------------------------ERROR--------------------------------------------");
  }
}


