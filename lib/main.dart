import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/asah_otak/asah_otak.dart';
import 'package:pustaka_app/screens/daftar_antrian/puskesmas_daftar_antrian.dart';
import 'package:pustaka_app/screens/home/home_all_health_article.dart';
import 'package:pustaka_app/screens/home/home_screen.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian.dart';
import 'package:pustaka_app/screens/puskesmas/puskesmas_menu_screen.dart';
import 'package:pustaka_app/screens/puskesmas/puskesmas_peta.dart';
import 'package:pustaka_app/screens/puskesmas/puskesmas_search.dart';
import 'package:pustaka_app/screens/riwayat_antri.dart';
import 'package:pustaka_app/screens/splash_screen/splash_screen.dart';
import 'package:pustaka_app/screens/test_buta_warna/pustaka_buta_warna.dart';

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
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          PuskesmasMenuScreen.id: (context) => PuskesmasMenuScreen(),
          PuskesmasPeta.id: (context) => PuskesmasPeta(),
          PuskesmasSearch.id: (context) => PuskesmasSearch(),
          PuskesmasLihatAntrian.id: (context) => PuskesmasLihatAntrian(),
          PuskesmasDaftarAntrian.id: (context) => PuskesmasDaftarAntrian(),
          AsahOtak.id: (context) => AsahOtak(),
          PustakaButaWarna.id: (context) => PustakaButaWarna(),
          RiwayatKunjunganPuskesmas.id: (context) => RiwayatKunjunganPuskesmas(),
          HomeAllHealthArticle.id: (Context) => HomeAllHealthArticle()
        });
  }
}
