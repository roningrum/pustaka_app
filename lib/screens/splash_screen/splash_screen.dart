import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static String id = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  var _visible = true;

  startTime() async{
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, HomeScreen.id));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this);
    animation = new CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    animation.addListener(() {
      this.setState(() {
        startTime();
      });
    });
    _controller.forward();

    setState(() {
      _visible = !_visible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _){
          return new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Pustaka", style: kPustakaBlackBoldMedium.copyWith(
                    fontSize: 32
                ),)
              ],
            )
          );
        },
      ),
    );
  }
}
