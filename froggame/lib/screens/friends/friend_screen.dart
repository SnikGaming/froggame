// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_friend.dart';
import 'package:froggame/models/user_model.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/view_data/firestore_user.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  static List<UserModel> lsData = FureStoreUser.lsUserAll;
  var txt_key = TextEditingController();
  var _index = StrFriend.friend[0];

  _search(String txt) {
    FureStoreUser.getUserSearch(txt);
    lsData = FureStoreUser.lsUserSearch;
  }

  _itemFriend(Size size) {
    // ignore: sized_box_for_whitespace
    return Container();
  }

  _itemAddFriend(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: txt_key,
            decoration: const InputDecoration(
              hintText: 'Tìm kiếm',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (txt_key.text.isNotEmpty) {
                  _search(txt_key.text);
                } else {
                  lsData = FureStoreUser.lsUserAll;
                }
                setState(() {});
              },
              child: const Icon(Icons.search)),
          // ignore: sized_box_for_whitespace
          Container(
              height: size.height * .82,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: lsData.length,
                  itemBuilder: ((context, index) => Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: const ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.add,
                              label: 'Kết bạn',
                            ),
                            SlidableAction(
                              flex: 2,
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF0392CF),
                              foregroundColor: Colors.white,
                              icon: Icons.info,
                              label: 'Thông tin',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(lsData[index].pic),
                          ),
                          title: Text(lsData[index].name),
                        ),
                      )))),
        ],
      ),
    );
  }

  _itemFriendRequest(Size size) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(gradient: background),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                UserHeader(height: size.height * .1, context: context),
                SingleChildScrollView(
                  child: SizedBox(
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
                ),
                Expanded(
                  child: _index == StrFriend.friend[0]
                      ? _itemFriend(size)
                      : _index == StrFriend.friend[1]
                          ? _itemAddFriend(size)
                          : _itemFriendRequest(size),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
