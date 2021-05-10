import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/home_screen.dart';
import 'package:pustaka_app/screens/daftar_antrian/puskesmas_daftar_antrian.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian.dart';
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
    return MaterialApp(
        title: 'Pustaka App',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
          ),
          primaryColor: kPrimaryColor,
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          PuskesmasMenuScreen.id: (context) => PuskesmasMenuScreen(),
          PuskesmasPeta.id: (context) => PuskesmasPeta(),
          PuskesmasSearch.id: (context) => PuskesmasSearch(),
          PuskesmasLihatAntrian.id: (context) => PuskesmasLihatAntrian(),
          PuskesmasDaftarAntrian.id: (context) => PuskesmasDaftarAntrian(),
        });
  }
}
