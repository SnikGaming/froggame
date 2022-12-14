import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_option.dart';
import 'package:froggame/screens/battle/battle_screen.dart';
import 'package:froggame/screens/friends/friend_screen.dart';
import 'package:froggame/screens/history/info.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/screens/profile/profile_screen.dart';
import 'package:froggame/screens/profile/profile_screen_data.dart';
import 'package:froggame/screens/settings/setting_screen.dart';
import 'package:froggame/screens/shop/shop_screen.dart';
import 'package:froggame/screens/categories/category_question.dart';
import 'package:froggame/screens/support/support.dart';
import 'package:froggame/view_data/data_PackBattle.dart';
import 'package:froggame/view_data/firestore_history.dart';
import 'package:froggame/view_data/firestore_rank.dart';
import 'package:froggame/view_data/login_method.dart';
import 'package:froggame/view_data/user_pre.dart';
import '../../const/colors.dart';
import '../../const/next_screen.dart';
import '../../const/text_style.dart';
import '../../const/values.dart';
import '../../view_data/package_method.dart';
import 'package:froggame/models/lobby_model.dart';

class QuizzHome extends StatelessWidget {
  QuizzHome({super.key});

  bool isBattle = true;
  List<LobbyModel> lsLobby = DataPackageBattle.listLobby();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appbarWidget(),
        endDrawer: drawerWidget(context),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(gradient: background),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //!Img
                AnimatedCusScal(
                    context: context,
                    chil: Image.asset(
                      StrOption.img,
                      height: size.height * .3,
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: normalText(
                        text: StrOption.caption, color: lightgrey, size: 18)),
                Row(
                  children: [
                    Image.asset(
                      frog_icon,
                      height: 45,
                    ),
                    headingText(
                        text: StrOption.namegame, size: 32, color: Colors.white)
                  ],
                ),

                // ignore: todo
                // //TODO :Slider
                CarouselSlider(
                    items: [
                      ViewData(
                        txt: "H??y ?????n ????y v???i ch??ng t??i...",
                      ),
                      ViewData(
                        txt: "H??y v???a h???c v???a ch??i...",
                      ),
                      ViewData(
                        txt: "Ti???p thu c??c ki???n th???c...",
                      )
                    ],
                    options: CarouselOptions(
                      height: size.height * .24,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(
                  //height: 40,
                  height: size.height * .02,
                ),
                AnimatedCus(
                  context: context,
                  y: 120,
                  chil: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(size.width, 45),
                            elevation: 9,
                            shadowColor: Colors.orange,
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(240, 40),
                            //  side: const BorderSide(width: 2, color: blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            PackageMethod.InitPackage();

                            profileData.getAllData();

                            nextScreen(context, const TypeQuestionPage());
                          },
                          child: Text(
                            StrOption.tieptuc,
                            style: F_lobster.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                ),
                AnimatedCus(
                    context: context,
                    y: 120,
                    chil: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: Size(size.width, 45),
                              elevation: 9,
                              shadowColor: const Color.fromARGB(255, 255, 0, 0),
                              // ignore: deprecated_member_use
                              primary: const Color.fromARGB(255, 255, 0, 0),
                              minimumSize: const Size(240, 40),
                              //  side: const BorderSide(width: 2, color: blue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              if (lsLobby.length == 0) {
                                nextScreen(
                                    context,
                                    BattleScreen(
                                      idLobby: "",
                                      idUser1: "",
                                    ));
                              }
                              for (int i = 0; i < lsLobby.length; i++) {
                                if (lsLobby[i].user2 ==
                                    UserSimplePreferences.getUserId()) {
                                  nextScreen(
                                      context,
                                      BattleScreen(
                                        idLobby: lsLobby[i].id,
                                        idUser1: lsLobby[i].user1,
                                      ));
                                }
                                if (lsLobby[i].user2 !=
                                    UserSimplePreferences.getUserId()) {
                                  nextScreen(
                                      context,
                                      BattleScreen(
                                        idLobby: "",
                                        idUser1: "",
                                      ));
                                }
                              }
                            },
                            child: Text(
                              StrOption.doikhang,
                              style: F_lobster.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                      ),
                    ))
              ],
            ),
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
                profileData.getAllData();

                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(ctx).push(
                      MaterialPageRoute(builder: (_) => const ProfileScreen()));
                });
                //Profile
              },
              child: AnimatedCusScal(
                  context: ctx,
                  chil: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: UserSimplePreferences.getAvatar() != ""
                                ? DecorationImage(
                                    image: AssetImage(
                                        UserSimplePreferences.getAvatar()),
                                    fit: BoxFit.contain)
                                : DecorationImage(
                                    image: NetworkImage(
                                        UserSimplePreferences.getUserPic()),
                                    fit: BoxFit.contain)),
                      ),
                      const Spacer(),
                      headingText(
                          text: UserSimplePreferences.getName() != ""
                              ? UserSimplePreferences.getName()
                              : UserSimplePreferences.getUsername(),
                          color: white,
                          size: 20)
                    ],
                  )),
            ),
          ),
          StrOption.listView(
              str: StrOption.bxh,
              func: () {
                FutureHistory.getAllDataPack(1);
                FutureRank.getAllData(1, UserSimplePreferences.getUserId());
                nextScreen(ctx, const infomation_screen());
              },
              colorIcon: yellow,
              icon: FontAwesomeIcons.crown),
          StrOption.listView(
              func: () => nextScreen(ctx, const ShopScreen()),
              str: StrOption.shop,
              colorIcon: Colors.blue.shade300,
              icon: FontAwesomeIcons.shop),
          StrOption.listView(
              func: () => nextScreen(ctx, const FriendScreen()),
              str: StrOption.friend,
              colorIcon: Colors.green.shade300,
              icon: FontAwesomeIcons.userGroup),
          StrOption.listView(
              func: () {
                show_ModalBottomSheet(ctx);
              },
              str: StrOption.support,
              colorIcon: Colors.blue,
              icon: FontAwesomeIcons.question),
          StrOption.listView(
              func: () => nextScreen(ctx, const SettingScreen()),
              str: StrOption.setting,
              colorIcon: lightgrey,
              icon: FontAwesomeIcons.wrench),
          StrOption.listView(
              func: () async {
                try {
                  AuthMethod.googleSignOutMethod(ctx);
                } catch (e) {
                  // ignore: avoid_print
                  print("Loi $e");
                }
              },
              str: StrOption.signout,
              colorIcon: purple,
              // ignore: deprecated_member_use
              icon: FontAwesomeIcons.signOut),
          StrOption.listView(
              func: () => exit(0),
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
