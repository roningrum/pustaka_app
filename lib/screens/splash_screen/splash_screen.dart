import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static String id = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer _timer;

  removeScreen() {
    return _timer = Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.id);
    });
  }

  @override
  void initState() {
    super.initState();
    removeScreen();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurfaceColor,
      body: Stack(
        children: [ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/pustaka.png')),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  "Pustaka",
                  style: kPustakaBlackBoldMedium.copyWith(
                      fontSize: 24, height: 1.2, letterSpacing: 1.25),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(4),
                child: Text(
                  "Puskemas Tanpa Antri Kota Semarang",
                  style: kPustakaBlackBoldMedium.copyWith(
                      fontSize: 16,
                      height: 1.2,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.w300),
                ),
              ),

            ],
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              padding: EdgeInsets.all(4),
              child: Text(
                "\u00a9 Dinas Kesehatan Kota Semarang 2018",
                style: kPustakaBlackBoldMedium.copyWith(
                    fontSize: 12,
                    height: 1.2,
                    color: Colors.black38,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
      ]),
    );
  }
}
