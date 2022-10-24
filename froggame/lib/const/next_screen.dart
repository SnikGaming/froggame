import 'package:flutter/material.dart';

nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
