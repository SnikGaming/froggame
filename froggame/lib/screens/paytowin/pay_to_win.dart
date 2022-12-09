import 'package:flutter/material.dart';
import 'package:froggame/const/text_style.dart';
// ignore: unused_import
import 'package:froggame/screens/gameplay/options_screen.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../const/colors.dart';
import '../../screen_load/user_view_header.dart';
import '../../view_data/firesore_napthe.dart';
import '../../view_data/firestore_user.dart';

class PaytoWin extends StatefulWidget {
  const PaytoWin({super.key});

  @override
  State<PaytoWin> createState() => _PaytoWinState();
}

class _PaytoWinState extends State<PaytoWin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [bg1, bg2],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              SizedBox(
                height: size.height * .05,
                child: UserHeader(height: size.height),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: size.height * .9,
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

AppBar appbarWidget() {
  return AppBar(
    title: const Text('Hỗ trợ'),
    elevation: 0,
    backgroundColor: bg1,
  );
}

// ignore: non_constant_identifier_names
showCard({required int MenhGia, required context}) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'Bạn đã nạp thành công $MenhGia.000 Vnđ',
  );
}
