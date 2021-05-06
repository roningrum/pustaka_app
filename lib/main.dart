import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/antrian_menu_screen.dart';
import 'package:pustaka_app/screens/home_screen.dart';
import 'package:pustaka_app/screens/puskesmas_menu_screen.dart';
import 'package:pustaka_app/screens/puskesmas_peta.dart';
import 'package:pustaka_app/screens/puskesmas_search.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Pustaka App',
          theme: ThemeData(
            primaryColor: kPrimaryColor
          ),
          initialRoute: HomeScreen.id,
          routes:{
            HomeScreen.id : (context) => HomeScreen(),
            PuskesmasMenuScreen.id : (context) => PuskesmasMenuScreen(),
            PuskesmasPeta.id : (context) => PuskesmasPeta(),
            PuskesmasSearch.id : (context) => PuskesmasSearch(),
            AntrianMenu.id : (context) => AntrianMenu(),
          }
      ),
    );
    return MaterialApp(
      title: 'Pustaka App',
      initialRoute: HomeScreen.id,
      routes:{
        HomeScreen.id : (context) => HomeScreen(),
        PuskesmasMenuScreen.id : (context) => PuskesmasMenuScreen()
      },
    );
  }
}