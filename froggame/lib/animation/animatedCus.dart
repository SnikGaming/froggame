// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

// ignore: non_constant_identifier_names
AnimatedCus(
    {required BuildContext context,
    double? x,
    double? y,
    required chil,
    int? s,
    Curve? curve}) {
  return TweenAnimationBuilder(
      curve: curve ?? Curves.linear,
      tween: Tween(begin: 1.0, end: 0.0),
      duration: Duration(milliseconds: s ?? 2000),
      builder: (context, value, child) {
        return Transform.translate(
            offset: Offset(
                x != null ? x * value : 0.0, y != null ? y * value : 0.0),
            child: chil);
      });
}

// ignore: non_constant_identifier_names
AnimatedCusScal(
    {required BuildContext context,
    double? x,
    double? y,
    required chil,
    int? s,
    Curve? curve}) {
  return TweenAnimationBuilder(
      curve: curve ?? Curves.linear,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: s ?? 500),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: chil);
      });
}
