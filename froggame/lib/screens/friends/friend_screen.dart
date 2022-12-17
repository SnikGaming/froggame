// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_friend.dart';
import 'package:froggame/models/user_model.dart';
import 'package:froggame/models/friend_model.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/view_data/firesore_addfriend.dart';
import 'package:froggame/view_data/firestore_user.dart';
import 'package:froggame/view_data/user_pre.dart';

enum Action { Add, Remove, Accept, Refuse }

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  loadData() async {
    await AddFriend.getAddFriend(UserSimplePreferences.getUserId());
    await AddFriend.getFriend(UserSimplePreferences.getUserId());
    var data1 = AddFriend.lsFriend;
    var data2 = AddFriend.lsAddFriend;
    setState(() {});
    lsFriend = data1;
    lsAddFriend = data2;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  static List<UserModel> lsData = FureStoreUser.lsUserAll;
  List<FriendModel> lsAddFriend = [];
  List<FriendModel> lsFriend = [];

  // ignore: non_constant_identifier_names
  var txt_key = TextEditingController();
  var _index = StrFriend.friend[0];

  _search(String txt) {
    FureStoreUser.getUserSearch(txt);
    lsData = FureStoreUser.lsUserSearch;
  }

  void addFriend(String idFriend, String nameFriend, String emailFriend,
      String picFriend, Action action) {
    AddFriend.Save(
        idfriend: idFriend,
        friendname: nameFriend,
        emailfriend: emailFriend,
        picfriend: picFriend);
  }

  void acceptFriend(String idFiend, Action action) {
    AddFriend.acceptFriend(idFiend);
  }

  void refuseFriend(String idFiend, Action action) {
    AddFriend.refuseFriend(idFiend);
  }

  viewUser(BuildContext context) {}

  _itemFriend(Size size, List<FriendModel> friend) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
              height: size.height * .82,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: lsFriend.length,
                  itemBuilder: ((context, index) => Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              onPressed: (context) {
                                setState(() {});
                                return acceptFriend(
                                    lsAddFriend[index].idfriend, Action.Accept);
                              },
                              backgroundColor: const Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.add,
                              label: 'Thông tin',
                            ),
                            SlidableAction(
                              flex: 2,
                              onPressed: (context) {
                                setState(() {});

                                refuseFriend(
                                    lsAddFriend[index].idfriend, Action.Accept);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.close,
                              label: 'Xóa bạn',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(lsFriend[index].pic),
                          ),
                          title: Text(lsFriend[index].friendname),
                          subtitle: Text(lsFriend[index].email),
                        ),
                      )))),
        ],
      ),
    );
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
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              onPressed: (context) => addFriend(
                                  lsData[index].userId,
                                  lsData[index].name,
                                  lsData[index].email,
                                  lsData[index].pic,
                                  Action.Add),
                              backgroundColor: const Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.add,
                              label: 'Kết bạn',
                            ),
                            SlidableAction(
                              flex: 2,
                              onPressed: viewUser,
                              backgroundColor: const Color(0xFF0392CF),
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
                            backgroundImage: NetworkImage(lsData[index].pic),
                          ),
                          title: Text(lsData[index].name),
                        ),
                      )))),
        ],
      ),
    );
  }

  _itemFriendRequest(Size size, List<FriendModel> lsAddFriend) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
              height: size.height * .82,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: lsAddFriend.length,
                  itemBuilder: ((context, index) => Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              onPressed: (context) {
                                setState(() {});
                                return acceptFriend(
                                    lsAddFriend[index].idfriend, Action.Accept);
                              },
                              backgroundColor: const Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.add,
                              label: 'Chấp nhận',
                            ),
                            SlidableAction(
                              flex: 2,
                              onPressed: (context) {
                                setState(() {});

                                refuseFriend(
                                    lsAddFriend[index].idfriend, Action.Accept);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.close,
                              label: 'Từ chối',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(lsAddFriend[index].pic),
                          ),
                          title: Text(lsAddFriend[index].friendname),
                          subtitle: Text(lsAddFriend[index].email),
                        ),
                      )))),
        ],
      ),
    );
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
                      ? _itemFriend(size, lsFriend)
                      : _index == StrFriend.friend[1]
                          ? _itemAddFriend(size)
                          : _itemFriendRequest(size, lsAddFriend),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
