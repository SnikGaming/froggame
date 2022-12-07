import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_option.dart';
import 'package:froggame/screens/history/info.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/screens/paytowin/pay_to_win.dart';
import 'package:froggame/screens/settings/setting_screen.dart';
import 'package:froggame/screens/shop/shop_screen.dart';
import 'package:froggame/screens/categories/category_question.dart';
import 'package:froggame/screens/support/support.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      txt: "Hãy đến đây với chúng tôi...",
                    ),
                    ViewData(
                      txt: "Hãy vừa học vừa chơi...",
                    ),
                    ViewData(
                      txt: "Tiếp thu các kiến thức...",
                    )
                  ],
                  options: CarouselOptions(
                    //height: 150,
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
              const SizedBox(
                height: 30,
              ),
              Align(
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
                        
                        nextScreen(context, const TypeQuestionPage());
                      },
                      child: Text(
                        StrOption.tieptuc,
                        style: F_lobster.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
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
              func: () => nextScreen(ctx, const ShopScreen()),
              str: StrOption.shop,
              colorIcon: Colors.blue.shade300,
              icon: FontAwesomeIcons.shop),
          StrOption.listView(
              func: () => nextScreen(ctx, const PaytoWin()),
              str: StrOption.card,
              colorIcon: green,
              icon: FontAwesomeIcons.moneyBills),
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
