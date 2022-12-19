import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/models/visit_friend_model.dart';
import 'package:froggame/view_data/user_pre.dart';

class ProfileFriendScreen extends StatefulWidget {
  List<FriendInfo> lstProfile = [];
  ProfileFriendScreen({Key? key, required this.lstProfile}) : super(key: key);

  @override
  State<ProfileFriendScreen> createState() => _ProfileFriendScreenState();
}

class _ProfileFriendScreenState extends State<ProfileFriendScreen> {
  List<Widget> lstIconAdd_Remove = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.person_add_outlined),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.person_remove_outlined,
          color: Colors.blue,
        ),
      ],
    ),
  ];
  bool chkToggle = false;
  var indexToggle = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lstVisitFriend = this.widget.lstProfile;
  }

  List<FriendInfo> lstVisitFriend = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 5),
            ]),
            child: IconButton(
              iconSize: 30,
              color: Colors.blueGrey,
              onPressed: () async {
                Navigator.pop(context);
                lstVisitFriend.clear();
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: background),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              right: size.width * 0.3 - 100,
              child: GestureDetector(
                onTap: () {
                  indexToggle == 1 ? chkToggle = true : chkToggle = false;
                  setState(() {
                    chkToggle
                        ? showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.purple.shade100,
                              title: RichText(
                                text: TextSpan(
                                  text: 'Bạn chắc chắn muốn hủy kết bạn với \n',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 75, 54, 159),
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: lstVisitFriend[0].name,
                                        style: F_pacifico.copyWith(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontFamily: 'quick',
                                            fontWeight: FontWeight.w200)),
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        indexToggle = 1;
                                      });
                                    },
                                    child: Text('Cancel')),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                      indexToggle = 0;
                                    });
                                  },
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          )
                        : indexToggle = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color:
                              indexToggle == 0 ? Colors.black87 : Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: _toggleFriend(indexToggle),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: size.height * 0.009,
              child: Container(
                width: size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(lstVisitFriend[0].avatar),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        '${lstVisitFriend[0].name}',
                        style: F_lobster.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: RichText(
                        text: TextSpan(
                          text: 'ID: ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 75, 54, 159),
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                                text: lstVisitFriend[0].iduser,
                                style: F_pacifico.copyWith(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'quick',
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              left: size.width * 0.05,
              child: AnimatedCus(
                context: context,
                y: 60,
                chil: Container(
                  width: size.width * 0.95,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                    lstVisitFriend[0].lstCat[index].img),
                              ),
                              Container(
                                child: Text(
                                  lstVisitFriend[0].lstCat[index].name,
                                  style: F_lobster.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  lstVisitFriend[0].score.toString(),
                                  style: F_pacifico.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Divider(
                                thickness: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toggleFriend(int index) {
    return Center(
      child: lstIconAdd_Remove[index],
    );
  }
}
