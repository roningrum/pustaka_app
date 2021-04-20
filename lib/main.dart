import 'package:flutter/material.dart';
import 'package:pustaka_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pustaka App',
      initialRoute: HomeScreen.id,
      routes:{
        HomeScreen.id : (context) => HomeScreen()
      },
    );
  }
}