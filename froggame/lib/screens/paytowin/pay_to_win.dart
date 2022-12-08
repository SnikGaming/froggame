import 'package:flutter/material.dart';
import 'package:froggame/const/text_style.dart';
// ignore: unused_import
import 'package:froggame/screens/gameplay/options_screen.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../const/colors.dart';
import '../../view_data/firestore_user.dart';

class PaytoWin extends StatefulWidget {
  const PaytoWin({super.key});

  @override
  State<PaytoWin> createState() => _PaytoWinState();
}

class _PaytoWinState extends State<PaytoWin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bg1, bg2],
          ),
        ),
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
                    score: UserSimplePreferences.getScore() + 20);
                FureStoreUser.addDataUser(
                    heart: UserSimplePreferences.getHeart(),
                    score: UserSimplePreferences.getScore());
                showCard(MenhGia: 20, context: context);

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
                      text: "20.000đ \n 20 coin", size: 18, color: blue),
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
                showCard(MenhGia: 50, context: context);

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
                      text: "50.000đ \n 50 coin", size: 18, color: blue),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                UserSimplePreferences.setHeart(
                    heart: UserSimplePreferences.getHeart() + 4);
                UserSimplePreferences.setScore(
                    score: UserSimplePreferences.getScore() + 100);
                FureStoreUser.addDataUser(
                    heart: UserSimplePreferences.getHeart(),
                    score: UserSimplePreferences.getScore());
                showCard(MenhGia: 100, context: context);

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
                      text: "100.000đ \n 100 coin", size: 18, color: blue),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                UserSimplePreferences.setHeart(
                    heart: UserSimplePreferences.getHeart() + 6);
                UserSimplePreferences.setScore(
                    score: UserSimplePreferences.getScore() + 200);
                FureStoreUser.addDataUser(
                    heart: UserSimplePreferences.getHeart(),
                    score: UserSimplePreferences.getScore());
                showCard(MenhGia: 200, context: context);
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
                      text: "200.000đ \n 200 coin", size: 18, color: blue),
                ],
              ),
            ),
          ],
        ),
      ),
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

showCard({required int MenhGia, required context}) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'Bạn đã nạp thành công ${MenhGia}.000 Vnđ',
  );
}
