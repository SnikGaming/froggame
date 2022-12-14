import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_friend.dart';
import 'package:froggame/screen_load/user_view_header.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  var _index = StrFriend.friend[0];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(gradient: background),
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                UserHeader(height: size.height * .1, context: context),
                SingleChildScrollView(
                  child: Container(
                    height: size.height * .09,
                    child: Row(
                      children: List.generate(
                          StrFriend.friend.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  _index = StrFriend.friend[index];
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: StrFriend.friend[index] == _index
                                          ? StrFriend.Clcik
                                          : StrFriend.NoClcik,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        StrFriend.friend[index] == _index
                                            ? const BoxShadow(
                                                color: StrFriend.Clcik,
                                                spreadRadius: 1,
                                                blurRadius: 15,
                                                offset: Offset(0, 6))
                                            : const BoxShadow(
                                                color: StrFriend.NoClcik,
                                                spreadRadius: 1,
                                                blurRadius: 15,
                                                offset: Offset(0, 6))
                                      ],
                                    ),
                                    child: Text(
                                      StrFriend.friend[index],
                                      style: F_popins.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              StrFriend.friend[index] == _index
                                                  ? white
                                                  : lightgrey),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
