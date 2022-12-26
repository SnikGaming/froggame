// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/font_app.dart';
import 'package:froggame/const/next_screen.dart';
import 'package:froggame/main.dart';
import 'package:froggame/models/friend_model.dart';
import 'package:froggame/models/questions_model.dart';
import 'package:froggame/screens/battle/battle_game_play_screen.dart';
import 'package:froggame/view_data/data_PackBattle.dart';
import 'package:froggame/view_data/firesore_addfriend.dart';
import 'package:froggame/view_data/user_pre.dart';
import 'package:http/http.dart' as http;

class BattleScreen extends StatefulWidget {
  String idLobby, idUser1;
  BattleScreen({super.key, required this.idLobby, required this.idUser1});

  @override
  State<BattleScreen> createState() =>
      _BattleScreenState(idLobby: idLobby, idUser1: idUser1);
}

class _BattleScreenState extends State<BattleScreen> {
  String idLobby;
  String idUser1;
  _BattleScreenState({required this.idLobby, required this.idUser1});

  String idPhong =
      "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${Random().nextInt(1000)}";
  int _counter = 0;
  late String _textTitle = " đang muốn bạn solo kìa !!!";
  // ignore: prefer_interpolation_to_compose_strings
  late String _textBody = 'Phòng ';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  String avatar = "";
  int pic = 0;
  List<FriendModel> lsFriend = [];
  late Future<List<QuestionModel>> lsQuestions;

  loadData() async {
    lsFriend = AddFriend.getFriend(UserSimplePreferences.getUserId());
    // ignore: unrelated_type_equality_checks
    if (idLobby == "") {
      await DataPackageBattle.CreateQuestion();
      await DataPackageBattle.CreateDataQuestionBattle(
          id: idPhong, idUser: UserSimplePreferences.getUserId());

      var data2 = DataPackageBattle.getAllQuestionBattle(id: idPhong);
      lsQuestions = data2;
    } else {
      for (int i = 0; i < lsFriend.length; i++) {
        if (lsFriend[i].idfriend == idUser1) {
          avatar = lsFriend[i].pic;
        }
      }
      //await DataPackageBattle.loadDataUser2(id: idLobby);
      var data2 = DataPackageBattle.getAllQuestionBattle(id: idLobby);
      lsQuestions = data2;
    }

    setState(() {});
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    _textBody = 'Phòng $idPhong';
    _textTitle =
        UserSimplePreferences.getUsername() + " đang muốn bạn solo kìa !!!";
    loadData();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher'),
            ));
      }
    });
  }

  bool isStart = false;
  bool isLsbanbe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 62, 10, 117),
                Color.fromARGB(228, 233, 30, 98)
              ],
            ),
          ),
          child:

              /// [Stack More Detail](https://api.flutter.dev/flutter/widgets/Stack-class.html)
              Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: <Widget>[
              Visibility(
                visible: isStart,
                child: Image.asset("assets/vs.webp"),
              ),
              Visibility(
                visible: !isStart,
                child: Image.asset("assets/vs1.webp"),
              ),

              //!: BTN
              Positioned(
                bottom: 20,
                left: 20,
                child: AnimatedCus(
                  context: context,
                  curve: Curves.easeInToLinear,
                  x: -50,
                  y: 90,
                  s: 700,
                  chil: Visibility(
                    visible: !isStart,
                    child: GestureDetector(
                      onTap: () {
                        isStart = !isStart;
                        setState(() {});
                        Future.delayed(const Duration(milliseconds: 900), () {
                          if (isStart) {
                            nextScreen(
                                context,
                                BattleQuizzGameScreen(
                                  lsQuestions: lsQuestions,
                                  idLobby: idLobby,
                                  idPhong: idPhong,
                                ));
                          }
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/button/btn_1/9.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Text("Start"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //!: VS1
              Positioned(
                  top: 40,
                  left: 40,
                  child: AnimatedCus(
                    s: 700,
                    x: -160,
                    context: context,
                    chil: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.amber,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: UserSimplePreferences.getAvatar() == ""
                              ? DecorationImage(
                                  image: NetworkImage(
                                    UserSimplePreferences.getUserPic(),
                                  ),
                                )
                              : DecorationImage(
                                  image: AssetImage(
                                    UserSimplePreferences.getAvatar(),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  )),
              //!: ID
              Positioned(
                top: 40,
                right: 0,
                child: AnimatedCus(
                  s: 700,
                  context: context,
                  y: -70,
                  curve: Curves.elasticInOut,
                  chil: Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      idLobby == "" ? idPhong : idLobby,
                      style: F_pacifico.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              //!: VS2
              Positioned(
                  bottom: 40,
                  right: 40,
                  child: AnimatedCus(
                    s: 700,
                    x: 160,
                    context: context,
                    chil: SizedBox(
                      height: 280,
                      width: 300,
                      child: Stack(
                        children: [
                          // ignore: todo
                          //TODO: USER
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                isLsbanbe = !isLsbanbe;

                                setState(() {});
                              },
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.amber,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: avatar == ""
                                        ? const DecorationImage(
                                            image: AssetImage(
                                              "assets/images/add.png",
                                            ),
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(
                                              avatar,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ignore: todo
                          //TODO: LIST USER
                          Visibility(
                            visible: isLsbanbe,
                            child: Container(
                              height: 160,
                              padding: const EdgeInsets.all(10),
                              width: size.width - 40,
                              decoration: BoxDecoration(
                                  color: Colors.purpleAccent,
                                  borderRadius: BorderRadius.circular(16)),
                              child: GridView.builder(
                                  itemCount: lsFriend.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          crossAxisCount: 4),
                                  itemBuilder: ((context, index) => Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: GestureDetector(
                                          onTapUp: ((details) {
                                            avatar = lsFriend[index].pic;
                                            pic = index;
                                            DataPackageBattle.user2Join(idPhong,
                                                lsFriend[index].idfriend);
                                            if (lsFriend[index]
                                                    .tokenMessage
                                                    .isNotEmpty &&
                                                check()) {
                                              pushNotificationsSpecificDevice(
                                                title: _textTitle,
                                                body: _textBody,
                                                token: lsFriend[index]
                                                    .tokenMessage,
                                              );
                                            }
                                            setState(() {});
                                          }),
                                          child: Image.network(
                                            lsFriend[index].pic,
                                          ),
                                        ),
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> pushNotificationsSpecificDevice({
    required String token,
    required String title,
    required String body,
  }) async {
    String dataNotifications = '{ "to" : "$token",'
        ' "notification" : {'
        ' "title":"$title",'
        '"body":"$body"'
        ' }'
        ' }';

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key= AAAAHKTkq-0:APA91bH0ubOIG85Ofw-mLm1u0aXk9R8YSD8G7O7VcyrbJ9j9QDeWSaU2K11i1mCjURqDglKaNZJ4WcoKXz0w5mbGnJePtKAvIV8AnkZEunBMt4-y4eCQBzNpr6YnU-Lg8jZch6YDAz0D',
      },
      body: dataNotifications,
    );
    return true;
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing $_counter",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  bool check() {
    if (UserSimplePreferences.getTokenMessage().isNotEmpty) {
      return true;
    }
    return false;
  }
}
