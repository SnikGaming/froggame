import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_shop.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/screen_load/view.dart';
import 'package:froggame/view_data/user_pre.dart';

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
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                //TODO : USER
                UserHeader(height: size.height * .1),
                //TODO : EVEN OR CARD
                Container(
                  child: CarouselSlider(
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
                ),

                //TODO : CATEGORIEs LIST
                SingleChildScrollView(
                  //scrollDirection: Axis.horizontal,
                  child: Container(
                    height: size.height * .1,
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
                                      color: StrShop.categories[index] == _index
                                          ? StrShop.Clcik
                                          : StrShop.NoClcik,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        StrShop.categories[index] == _index
                                            ? BoxShadow(
                                                color: StrShop.Clcik,
                                                spreadRadius: 1,
                                                blurRadius: 15,
                                                offset: const Offset(0, 6))
                                            : BoxShadow(
                                                color: StrShop.NoClcik,
                                                spreadRadius: 1,
                                                blurRadius: 15,
                                                offset: const Offset(0, 6))
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

                //TODO : ITEMS LIST
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * .52,
                  child: GridView.builder(
                      itemCount: StrShop.lstData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: StrShop.lsColor[
                                new Random().nextInt(StrShop.lsColor.length)],
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
