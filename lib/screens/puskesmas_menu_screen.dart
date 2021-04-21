import 'package:flutter/material.dart';

import '../const.dart';

class PuskesmasMenuScreen extends StatefulWidget {
  static String id = "puskesmas_menu";
  @override
  _PuskesmasMenuScreenState createState() => _PuskesmasMenuScreenState();
}

class _PuskesmasMenuScreenState extends State<PuskesmasMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: kSurfaceColor,
      elevation: 0,
      title: Text('Puskesmas',  style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
    ),
      body: Center(
        child: Text('Puskemas'),
      ),
    );
  }
}
