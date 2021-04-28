import 'package:flutter/material.dart';

import '../const.dart';
import 'home_screen.dart';

class AntrianMenu extends StatefulWidget {
  static String id = "antrian_menu";
  @override
  _AntrianMenuState createState() => _AntrianMenuState();
}

class _AntrianMenuState extends State<AntrianMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSurfaceColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: kFontColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(HomeScreen.id);
          },
        ),
       title: Text('Lihat Antrian Puskesmas',
          style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)
       ),
      ),
    );
  }
}
