import 'package:flutter/material.dart';
import 'package:froggame/animation/animatedCus.dart';
import 'package:froggame/const/font_app.dart';

import 'package:froggame/view_data/user_pre.dart';

import '../../const/colors.dart';
import '../../const/str_Type.dart';
import '../../const/str_avatar.dart';
import '../../view_data/firestore_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String avatar = UserSimplePreferences.getAvatar();
  final _controller = TextEditingController();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    if (UserSimplePreferences.getName() != "") {
      _controller.text = UserSimplePreferences.getName();
    } else {
      _controller.text = UserSimplePreferences.getUsername();
    }
  }

  bool isVis = false;
  bool isVisT = false;
  DateTime _date = DateTime.now();
  String date = "dd-MM-yyyy";

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(DateTime.now().year + 1))
        .then(
      (value) {
        _date = value!;
        date = "${_date.day}-${_date.month}-${_date.year}";
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(gradient: background),
            child: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.loose,
              children: [
                //!: Close
                Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTapUp: ((details) {
                        Navigator.of(context).pop();
                      }),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/button/close.png"))),
                      ),
                    )),
                //!: Name
                Positioned(
                    top: size.height * .26,
                    child: AnimatedCusScal(
                        x: 130,
                        curve: Curves.elasticOut,
                        s: 2400,
                        context: context,
                        chil: SizedBox(
                          height: 220,
                          width: size.width,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _controller.text,
                                        style: F_lobster.copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                        onTapUp: ((details) {
                                          isVisT = !isVisT;
                                          setState(() {});
                                        }),
                                        child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            height: 40,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.edit,
                                                color: white)),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //!: TEXT FIELD
                                Visibility(
                                  visible: isVisT,
                                  child: AnimatedCus(
                                    context: context,
                                    y: -40,
                                    s: 700,
                                    chil: SizedBox(
                                        width: size.width - 100,
                                        child: TextField(
                                          controller: _controller,
                                          maxLength: 32,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))),
                //!: DATE TIME
                Positioned(
                    top: size.height * .4,

                    //top: 370,
                    child: GestureDetector(
                      onTap: _showDatePicker,
                      child: SizedBox(
                        height: 60,
                        width: size.width,
                        child: AnimatedCus(
                          context: context,
                          s: 1200,
                          y: -250,
                          curve: Curves.bounceInOut,
                          chil: Center(
                              child: Text(date,
                                  style: const TextStyle(
                                      fontFamily: "DS-DIGITAL",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 0, 251, 9)))),
                        ),
                      ),
                    )),
                //!: Email
                Positioned(
                    top: size.height * .45,

                    //top: 370,
                    child: GestureDetector(
                      onTap: _showDatePicker,
                      child: SizedBox(
                        height: 60,
                        width: size.width,
                        child: Center(
                          child: AnimatedCusScal(
                            context: context,
                            curve: Curves.elasticInOut,
                            s: 2000,
                            chil: SelectableText.rich(
                              TextSpan(children: [
                                const TextSpan(
                                  text: "Gmail: ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 7, 7, 7),
                                  ),
                                ),
                                TextSpan(
                                  text: UserSimplePreferences.getUserEmail(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 251, 84, 0),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ),
                    )),

                //!: Avatar
                Positioned(
                  //top: 80,
                  top: size.height * .1,
                  child: AnimatedCus(
                      y: -140,
                      curve: Curves.slowMiddle,
                      s: 1200,
                      context: context,
                      chil: GestureDetector(
                        onTapUp: ((details) {
                          isVis = !isVis;
                          isVisT = false;

                          setState(() {});
                        }),
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.purple, Colors.pink],
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: avatar != ""
                                    ? Image.asset(avatar)
                                    : Image.network(
                                        UserSimplePreferences.getUserPic()),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: isVis,
                              child: AnimatedCusScal(
                                context: context,
                                curve: Curves.easeInCubic,
                                chil: Container(
                                  height: 160,
                                  padding: const EdgeInsets.all(10),
                                  width: size.width - 40,
                                  decoration: BoxDecoration(
                                      color: Colors.purpleAccent,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: GridView.builder(
                                      itemCount: lsAvatar.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5,
                                              crossAxisCount: 4),
                                      itemBuilder: ((context, index) =>
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.purple,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: GestureDetector(
                                              onTapUp: ((details) {
                                                avatar = lsAvatar[index];
                                                isVis = false;
                                                setState(() {});
                                              }),
                                              child: Image.asset(
                                                lsAvatar[index],
                                              ),
                                            ),
                                          ))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                //!: TIEU SU
                // Positioned(
                //   top: 360,
                //   child: Container(
                //     height: 90,
                //     width: size.width - 40,
                //     child: TextFormField(
                //       textInputAction: TextInputAction.done,
                //       maxLines: 2,
                //       minLines: 2,
                //       maxLength: 100,
                //       decoration: InputDecoration(
                //         label: Text("Tiểu sử"),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(16),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                //!: INFORMATION
                Positioned(
                  bottom: size.height * .1,
                  //bottom: 80 + 20,
                  child: Container(
                    height: size.height * .3,
                    // height: 280,
                    width: size.width,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemUser(
                          size: size,
                          img1: "assets/button/heart.png",
                          img2: "assets/button/coin.png",
                          txt1: UserSimplePreferences.getHeart().toString(),
                          txt2: UserSimplePreferences.getScore().toString(),
                        ),
                        itemUser(
                          size: size,
                          img1: TypeModel.listType[0].image,
                          img2: TypeModel.listType[1].image,
                          txt1: UserSimplePreferences.getHeart().toString(),
                          txt2: UserSimplePreferences.getScore().toString(),
                        ),
                        itemUser(
                          size: size,
                          img1: TypeModel.listType[2].image,
                          img2: TypeModel.listType[3].image,
                          txt1: UserSimplePreferences.getHeart().toString(),
                          txt2: UserSimplePreferences.getScore().toString(),
                        ),
                        itemUser(
                          size: size,
                          img1: TypeModel.listType[4].image,
                          img2: "assets/button/energy.png",
                          txt1: UserSimplePreferences.getHeart().toString(),
                          txt2: UserSimplePreferences.getScore().toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                //!: BTN SAVE
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Container(
                      height: 60,
                      width: 120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/button/14.png"),
                              fit: BoxFit.cover)),
                      child: TextButton(
                          onPressed: () {
                            if (_controller.text !=
                                UserSimplePreferences.getUsername()) {
                              UserSimplePreferences.setName(
                                  name: _controller.text);
                              FureStoreUser.addDataUser(
                                  heart: UserSimplePreferences.getHeart(),
                                  score: UserSimplePreferences.getScore());
                            }
                            if (avatar != "") {
                              UserSimplePreferences.setAvatar(avatar: avatar);
                              FureStoreUser.addDataUser(
                                  heart: UserSimplePreferences.getHeart(),
                                  score: UserSimplePreferences.getScore());
                            }
                            // print(
                            //     "===============================><<<<><><><><><$avatar");
                            setState(() {});
                          },
                          child: const Text("Lưu"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class itemUser extends StatelessWidget {
  const itemUser(
      {Key? key,
      required this.size,
      required this.img1,
      required this.img2,
      required this.txt1,
      required this.txt2})
      : super(key: key);

  final Size size;
  final String img1, img2, txt1, txt2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedCus(
              x: -120,
              y: -120,
              curve: Curves.elasticOut,
              context: context,
              chil: Row(
                children: [
                  Image.asset(
                    img1,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(txt1, style: F_lobster.copyWith(fontSize: 24))
                ],
              )),
          AnimatedCus(
              x: 120,
              y: -120,
              curve: Curves.elasticOut,
              context: context,
              chil: Row(
                children: [
                  Image.asset(
                    img2,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(txt2, style: F_lobster.copyWith(fontSize: 24))
                ],
              ))
        ],
      ),
    );
  }
}
