import 'package:flutter/material.dart';

nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

pushNamedRemove(context, page) =>
    Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
