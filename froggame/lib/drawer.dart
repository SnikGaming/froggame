import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:froggame/const/colors.dart';
import 'package:froggame/const/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestDrawer extends StatefulWidget {
  const TestDrawer({super.key});

  @override
  State<TestDrawer> createState() => _TestDrawerState();
}

class _TestDrawerState extends State<TestDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        backgroundColor: Color.fromARGB(255, 38, 36, 36),
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(),
            ),
            ListTile(
              onTap: () {},
              title: normalText(
                text: "BXH",
                color: white,
                size: 18,
              ),
              leading: FaIcon(
                FontAwesomeIcons.crown,
                color: yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
