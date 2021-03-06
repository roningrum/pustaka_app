import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/home/widget/home_artikel.dart';
import 'package:pustaka_app/screens/home/widget/home_banner.dart';
import 'package:pustaka_app/screens/home/widget/home_menu.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription sub;
  bool isConnected = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    sub.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurfaceColor,
      appBar: AppBar(
        backgroundColor: kSurfaceColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Pustaka',  style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
      ),
      body: CustomScrollView(
            slivers: [
             SliverToBoxAdapter(
               child:  Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                 HomeBanner(),
                 SizedBox(height: 48),
                 HomeMenu(),
                     SizedBox(height: 48),
               ]),
             ),
              SliverToBoxAdapter(
                  child: HomeArtikel()
              ),
            ],
          )

    );
  }
}
