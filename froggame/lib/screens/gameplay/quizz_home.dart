import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/screens/gameplay/quizz_screen.dart';
import '../../const/colors.dart';

import '../../const/next_screen.dart';
import '../../const/text_style.dart';
import '../../const/values.dart';

class QuizzHome extends StatelessWidget {
  const QuizzHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarWidget(),
        endDrawer: drawerWidget(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [bg1, bg2])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Img

              Image.asset(
                "assets/giphy.webp",
              ),
              // Image.network(
              //   frog_main1,
              // ),

              // const SizedBox(
              //   height: 10,
              // )
              //

              normalText(
                  text: "Welcome to our game!!! 🐸",
                  color: lightgrey,
                  size: 18),
              Row(
                children: [
                  Image.asset(
                    frog_icon,
                    height: 60,
                  ),
                  headingText(text: "FROG QUIZZ", size: 32, color: Colors.white)
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
                        minimumSize: Size(240, 40),
                        side: BorderSide(width: 2, color: blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        nextScreen(context, QuizzScreen());
                      },
                      child:
                          headingText(text: "Continue", size: 18, color: blue)),
                ),
              )
            ],
          ),
        ));
  }

  Drawer drawerWidget() {
    return Drawer(
      backgroundColor: bg1,
      child: ListView(
        children: [
          DrawerHeader(
            child: GestureDetector(
              onTap: () {
                //Profile
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/main.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            title: normalText(
              text: "BXH",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.crown,
              color: yellow,
              size: drawerSizeIcon,
            ),
          ),
          ListTile(
            onTap: () {},
            title: normalText(
              text: "Shop",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.shop,
              color: Colors.blue.shade300,
              size: drawerSizeIcon,
            ),
          ),
          ListTile(
            onTap: () {},
            title: normalText(
              text: "Pay to win",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.moneyBills,
              color: green,
              size: drawerSizeIcon,
            ),
          ),
          ListTile(
            onTap: () {},
            title: normalText(
              text: "About",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
              color: Colors.blue,
              size: drawerSizeIcon,
            ),
          ),
          ListTile(
            onTap: () {},
            title: normalText(
              text: "Setting",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.wrench,
              color: lightgrey,
              size: drawerSizeIcon,
            ),
          ),
          ListTile(
            onTap: () {},
            title: normalText(
              text: "Sign up",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.signOut,
              color: purple,
              size: drawerSizeIcon,
            ),
          ),
          ListTile(
            onTap: () {
              exit(0);
            },
            title: normalText(
              text: "Quit",
              color: white,
              size: 18,
            ),
            leading: FaIcon(
              FontAwesomeIcons.powerOff,
              color: red,
              size: drawerSizeIcon,
            ),
          ),
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
