import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/str_Type.dart';
import 'package:froggame/const/str_friend.dart';
import 'package:froggame/models/user_model.dart';
import 'package:froggame/screen_load/user_view_header.dart';
import 'package:froggame/view_data/firestore_user.dart';
import 'package:froggame/view_data/user_pre.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  static List<UserModel> lsData = FureStoreUser.lsUserAll;
  var txt_key = TextEditingController();
  @override
  var _index = StrFriend.friend[0];

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
          ElevatedButton(onPressed: () {}, child: Icon(Icons.search)),
          // ignore: sized_box_for_whitespace
          Container(
              height: size.height * .82,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: lsData.length,
                  itemBuilder: ((context, index) => Card(
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(lsData[index].pic)),
                          title: Text(lsData[index].name),
                          subtitle: Text('${lsData[index].score}'),
                          trailing: Icon(Icons.more_vert),
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



// StreamBuilder<QuerySnapshot>(
//         stream: FureStoreUser.StreamUsers,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final data = snapshot.data!.docs;
//             List<UserModel> lsUsers = [];
//             for (var row in data) {
//               final r = row.data() as Map<String, dynamic>;
//               // lsUsers.add(r['name']);
//               // lsUsers.add(r['pic']);
//               lsUsers.add(UserModel(
//                   userId: r['id'],
//                   email: r['email'],
//                   name: r['name'],
//                   pic: r['pic']));
//             }
//             return ListView.builder(
//               itemCount: lsUsers.length,
//               itemBuilder: (context, index) {
//                 TypeModel type = TypeModel.listType[index];
//                 return Card(
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'https://lh3.googleusercontent.com/a/AEdFTp6xrw-kUgufZTnmvBx3in1fw1QRZVw4nU49p2H9=s96-c'),
//                     ),
//                     title: Text(lsUsers[index].name),
//                     trailing: Icon(Icons.more_vert),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const CupertinoActivityIndicator(
//               color: Colors.orange,
//             );
//           }
//         },
//       ),
