import 'package:flutter/material.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/container.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
import 'package:froggame/const/font_app.dart';

import '../../const/colors.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({super.key});

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(gradient: background),
            child: Column(
              children: [
                //!:Titile
                // ignore: sized_box_for_whitespace
                Container(
                  width: size.width,
                  height: size.height * .15,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("THÔNG BÁO !!!",
                        style: F_pacifico.copyWith(
                            color: white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  ),
                ),

                //!: Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: size.width,
                    height: size.height * .7,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Text(
                              "Chúc mừng bạn đã hoàn thành 1/1 của lĩnh vực xxxx",
                              style: F_pacifico.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 24)),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Text(
                              "Chúc mừng bạn đã hoàn thành 1/1 của lĩnh vực xxxx",
                              style: F_pacifico.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 24)),
                        ),
                      ],
                    ),
                  ),
                ),
                //!: Button
                Container(),
              ],
            )),
      ),
    );
  }
}
