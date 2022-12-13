// ignore_for_file: unused_import

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
// ignore: implementation_imports
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_heart.dart';
import 'package:froggame/const/str_shop.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:froggame/const/str_pay.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../const/text_style.dart';
import '../../view_data/firesore_napthe.dart';
import '../../view_data/firestore_user.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int heart = UserSimplePreferences.getHeart();
  int score = UserSimplePreferences.getScore();

  itempay(size) {
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
              NapThe.Save(menhgia: int.parse(Hearts.Heart[index]));
              showCardPay(
                  MenhGia: int.parse(Hearts.Heart[index]), context: context);
              score = UserSimplePreferences.getScore();
              heart = UserSimplePreferences.getHeart();
              setState(() {});
            },
            child: Pay.item(Pay.Coins[index], Pay.MenhGia[index]),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(30),
              shadowColor: Colors.orange,
              // ignore: deprecated_member_use
              primary: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          );
        }),
      ),
    );
  }

  itemheart(size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * .52,
      child: GridView.builder(
        itemCount: Hearts.Coins.length,
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8, mainAxisSpacing: 8, crossAxisCount: 2),
        itemBuilder: ((context, index) {
          return ElevatedButton(
            onPressed: () {
              if (score >= int.parse(Hearts.Coins[index])) {
                UserSimplePreferences.setHeart(
                    heart: UserSimplePreferences.getHeart() +
                        int.parse(Hearts.Heart[index]));
                UserSimplePreferences.setScore(
                    score: UserSimplePreferences.getScore() -
                        int.parse(Hearts.Coins[index]));
                FureStoreUser.addDataUser(
                    heart: UserSimplePreferences.getHeart(),
                    score: UserSimplePreferences.getScore());
                showCardHeart(
                    heart: int.parse(Hearts.Heart[index]),
                    score: true,
                    context: context);
                score = UserSimplePreferences.getScore();
                heart = UserSimplePreferences.getHeart();
                setState(() {});
              } else {
                showCardHeart(
                    heart: int.parse(Hearts.Heart[index]),
                    score: false,
                    context: context);
              }
            },
            child: Hearts.item(Hearts.Coins[index], Hearts.Heart[index]),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(30),
              shadowColor: Colors.orange,
              // ignore: deprecated_member_use
              primary: Colors.orange,
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

                  // ~az
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
                  Expanded(
                    child: _index == StrShop.categories[0]
                        ? itemheart(size)
                        : itempay(size),
                  )

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

showCardPay({required int MenhGia, required context}) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'Bạn đã nạp thành công $MenhGia.000 Vnđ',
  );
}

showCardHeart({required int heart, required bool score, required context}) {
  if (score) {
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: 'Bạn đã mua thành công $heart ❤️',
    );
  } else {
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: 'Bạn đã không đủ điểm, vui lòng nạp thêm',
    );
  }
}
