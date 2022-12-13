import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/text_style.dart';
import 'package:froggame/const/values.dart';
import 'package:froggame/view_data/user_pre.dart';

class StrOption {
  static const bxh = "BXH";
  static const shop = "Cửa Hàng";
  static const support = "Hỗ Trợ";
  static const setting = "Cài Đặt";
  static const signout = "Đăng Xuất";
  static const quit = "Thoát";

  static const tieptuc = "TIẾP TỤC";
  // static final tieptuc = "Continue";

  static final caption =
      "Chào mừng ${UserSimplePreferences.getUsername()}\nđã đến với chúng tôi...!!! 🐸";

  // static final caption = "Welcome to our game!!! 🐸";
  static const namegame = "FROG QUIZZ";
  static const img = "assets/giphy.webp";

  static listView(
      {func,
      required String str,
      Color? color,
      required Color colorIcon,
      required IconData icon}) {
    return ListTile(
      onTap: func,
      title: normalText(
        text: str,
        color: color ?? white,
        size: 18,
      ),
      leading: FaIcon(
        icon,
        color: colorIcon,
        size: drawerSizeIcon,
      ),
    );
  }
}
