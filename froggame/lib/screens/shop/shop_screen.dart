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
import 'package:froggame/const/str_pay.dart';

import '../../const/text_style.dart';
import '../../view_data/firesore_napthe.dart';
import '../../view_data/firestore_user.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  itemdata(size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * .52,
      child: GridView.builder(
        itemCount: Pay.Coins.length,
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, mainAxisSpacing: 8, crossAxisCount: 2),
        itemBuilder: ((context, index) {
          return ElevatedButton(
            onPressed: () {
              UserSimplePreferences.setHeart(
                  heart: UserSimplePreferences.getHeart() + 2);
              UserSimplePreferences.setScore(
                  score: UserSimplePreferences.getScore() +
                      int.parse(Pay.Coins[index]));
              FureStoreUser.addDataUser(
                  heart: UserSimplePreferences.getHeart(),
                  score: UserSimplePreferences.getScore());
              NapThe.Save(menhgia: int.parse(Pay.MenhGia[index]));
              showCard(
                  MenhGia: int.parse(Pay.MenhGia[index]), context: context);

              setState(() {});
            },
            child: Pay.item(Pay.Coins[index], Pay.MenhGia[index]),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          );
        }),
      ),
    );
  }

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
                UserHeader(height: size.height * .1, context: context),
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
                  //
                  _index == StrShop.categories[0]
                      ? Container()
                      : _index == StrShop.categories[1]
                          ? Container()
                          : itemdata(size)
                  //
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
