import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/const/str_option.dart';
import 'package:froggame/screens/history/info.dart';
import 'package:froggame/screens/shop/shop_screen.dart';
import 'package:froggame/screens/type_question.dart';
import 'package:froggame/view_data/login_method.dart';
import 'package:froggame/view_data/user_pre.dart';
import '../../const/colors.dart';
import '../../const/next_screen.dart';
import '../../const/text_style.dart';
import '../../const/values.dart';

class QuizzHome extends StatelessWidget {
  const QuizzHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbarWidget(),
        endDrawer: drawerWidget(context),
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(gradient: background),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!Img
              Image.asset(
                StrOption.img,
              ),
              normalText(text: StrOption.caption, color: lightgrey, size: 18),
              Row(
                children: [
                  Image.asset(
                    frog_icon,
                    height: 60,
                  ),
                  headingText(
                      text: StrOption.namegame, size: 32, color: Colors.white)
                ],
              ),
              normalText(text: ""), const Spacer(),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        shadowColor: blue,
                        minimumSize: const Size(240, 40),
                        side: const BorderSide(width: 2, color: blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        nextScreen(context, const TypeQuestionPage());
                      },
                      child: headingText(
                          text: StrOption.tieptuc, size: 18, color: blue)),
                ),
              )
            ],
          ),
        ));
  }

  Drawer drawerWidget(BuildContext ctx) {
    return Drawer(
      backgroundColor: bg1,
      child: ListView(
        children: [
          DrawerHeader(
            child: GestureDetector(
              onTap: () {
                //Profile
              },
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                UserSimplePreferences.getUserPic()),
                            fit: BoxFit.contain)),
                  ),
                  const Spacer(),
                  headingText(
                      text: UserSimplePreferences.getUsername(),
                      color: white,
                      size: 20)
                ],
              ),
            ),
          ),
          StrOption.listView(
              str: StrOption.bxh,
              func: () {
                nextScreen(ctx, const infomation_screen());
              },
              colorIcon: yellow,
              icon: FontAwesomeIcons.crown),
          StrOption.listView(
              func: () {
                nextScreen(ctx, const ShopScreen());
              },
              str: StrOption.shop,
              colorIcon: Colors.blue.shade300,
              icon: FontAwesomeIcons.shop),
          StrOption.listView(
              str: StrOption.card,
              colorIcon: green,
              icon: FontAwesomeIcons.moneyBills),
          StrOption.listView(
              str: StrOption.about,
              colorIcon: Colors.blue,
              icon: FontAwesomeIcons.circleInfo),
          StrOption.listView(
              str: StrOption.setting,
              colorIcon: lightgrey,
              icon: FontAwesomeIcons.wrench),
          StrOption.listView(
              func: () async {
                try {
                  AuthMethod.googleSignOutMethod(ctx);
                } catch (e) {
                  print("Loi $e");
                }
              },
              str: StrOption.signout,
              colorIcon: purple,
              icon: FontAwesomeIcons.signOut),
          StrOption.listView(
              func: () {
                exit(0);
              },
              str: StrOption.quit,
              colorIcon: red,
              icon: FontAwesomeIcons.powerOff),
        ],
      ),
    );
  }

  AppBar appbarWidget() {
    return AppBar(
      elevation: 0,
      backgroundColor: bg1,
    );
  }
}
