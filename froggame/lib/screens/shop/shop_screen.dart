// ignore_for_file: unused_import

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
// ignore: implementation_imports
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_shop.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/screens/shop/shop_pay.dart';
import 'package:froggame/view_data/user_pre.dart';

import '../../const/text_style.dart';
import '../../view_data/firesore_napthe.dart';
import '../../view_data/firestore_user.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  var _index = StrShop.categories[0];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(gradient: background),
          // ignore: sized_box_for_whitespace
          child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  // ignore: todo
                  //TODO : USER
                  UserHeader(height: size.height * .1),
                  // ignore: todo
                  //TODO : EVEN OR CARD

                  CarouselSlider(
                      items: const [View()],
                      options: CarouselOptions(
                        height: size.height * .25,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 3000),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),

                  // ignore: todo
                  //TODO : CATEGORIEs LIST
                  SingleChildScrollView(
                    //scrollDirection: Axis.horizontal,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: size.height * .09,
                      child: Row(
                        children: List.generate(
                            StrShop.categories.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    _index = StrShop.categories[index];
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color:
                                            StrShop.categories[index] == _index
                                                ? StrShop.Clcik
                                                : StrShop.NoClcik,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          StrShop.categories[index] == _index
                                              ? const BoxShadow(
                                                  color: StrShop.Clcik,
                                                  spreadRadius: 1,
                                                  blurRadius: 15,
                                                  offset: Offset(0, 6))
                                              : const BoxShadow(
                                                  color: StrShop.NoClcik,
                                                  spreadRadius: 1,
                                                  blurRadius: 15,
                                                  offset: Offset(0, 6))
                                        ],
                                      ),
                                      child: Text(
                                        StrShop.categories[index],
                                        style: F_popins.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: StrShop.categories[index] ==
                                                    _index
                                                ? white
                                                : lightgrey),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),

                  // ignore: todo
                  //TODO : ITEMS LIST

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * .52,
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            UserSimplePreferences.setHeart(
                                heart: UserSimplePreferences.getHeart() + 2);
                            UserSimplePreferences.setScore(
                                score: UserSimplePreferences.getScore() + 12);
                            FureStoreUser.addDataUser(
                                heart: UserSimplePreferences.getHeart(),
                                score: UserSimplePreferences.getScore());
                            NapThe.Save(menhgia: 22);
                            showCard(MenhGia: 22, context: context);

                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                width: 50,
                                height: 50,
                              ),
                              headingText(
                                  text: "12 coin \n 22.000đ",
                                  size: 18,
                                  color: blue),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            UserSimplePreferences.setHeart(
                                heart: UserSimplePreferences.getHeart() + 2);
                            UserSimplePreferences.setScore(
                                score: UserSimplePreferences.getScore() + 50);
                            FureStoreUser.addDataUser(
                                heart: UserSimplePreferences.getHeart(),
                                score: UserSimplePreferences.getScore());
                            NapThe.Save(menhgia: 109);

                            showCard(MenhGia: 109, context: context);

                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                width: 50,
                                height: 50,
                              ),
                              headingText(
                                  text: "50 coin \n 109.000đ",
                                  size: 18,
                                  color: blue),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            UserSimplePreferences.setHeart(
                                heart: UserSimplePreferences.getHeart() + 4);
                            UserSimplePreferences.setScore(
                                score: UserSimplePreferences.getScore() + 220);
                            FureStoreUser.addDataUser(
                                heart: UserSimplePreferences.getHeart(),
                                score: UserSimplePreferences.getScore());
                            NapThe.Save(menhgia: 219);

                            showCard(MenhGia: 219, context: context);

                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                width: 50,
                                height: 50,
                              ),
                              headingText(
                                  text: "220 coin \n 219.000đ",
                                  size: 18,
                                  color: blue),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            UserSimplePreferences.setHeart(
                                heart: UserSimplePreferences.getHeart() + 6);
                            UserSimplePreferences.setScore(
                                score: UserSimplePreferences.getScore() + 450);
                            FureStoreUser.addDataUser(
                                heart: UserSimplePreferences.getHeart(),
                                score: UserSimplePreferences.getScore());
                            NapThe.Save(menhgia: 449);

                            showCard(MenhGia: 449, context: context);
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                width: 50,
                                height: 50,
                              ),
                              headingText(
                                  text: "450 coin \n 449.000đ",
                                  size: 18,
                                  color: blue),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            UserSimplePreferences.setHeart(
                                heart: UserSimplePreferences.getHeart() + 6);
                            UserSimplePreferences.setScore(
                                score: UserSimplePreferences.getScore() + 1000);
                            FureStoreUser.addDataUser(
                                heart: UserSimplePreferences.getHeart(),
                                score: UserSimplePreferences.getScore());
                            NapThe.Save(menhgia: 1099);

                            showCard(MenhGia: 1099, context: context);
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                width: 50,
                                height: 50,
                              ),
                              headingText(
                                  text: "1000 coin \n 1.099.000đ",
                                  size: 18,
                                  color: blue),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            UserSimplePreferences.setHeart(
                                heart: UserSimplePreferences.getHeart() + 6);
                            UserSimplePreferences.setScore(
                                score: UserSimplePreferences.getScore() + 2000);
                            FureStoreUser.addDataUser(
                                heart: UserSimplePreferences.getHeart(),
                                score: UserSimplePreferences.getScore());
                            NapThe.Save(menhgia: 2199);

                            showCard(MenhGia: 2199, context: context);
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/coin.png",
                                width: 50,
                                height: 50,
                              ),
                              headingText(
                                  text: "2000 coin \n 2.199.000đ",
                                  size: 18,
                                  color: blue),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 20),
              //   height: size.height * .52,
              //   child: GridView.builder(
              //       itemCount: StrShop.lstData.length,
              //       // ignore: prefer_const_constructors
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisSpacing: 8,
              //           mainAxisSpacing: 8,
              //           crossAxisCount: 2),
              //       itemBuilder: ((context, index) {
              //         return Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: StrShop.lsColor[
              //                 // ignore: unnecessary_new
              //                 new Random().nextInt(StrShop.lsColor.length)],
              //           ),
              //         );
              //       })),
              // ),
              ),
        ),
      ),
    );
  }
}
