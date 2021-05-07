import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/puskesmas_lihat_antrian.dart';
import 'package:pustaka_app/screens/puskesmas_menu_screen.dart';
import 'package:pustaka_app/widget/pustaka_icon_menu.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
      body: Container(
          child :SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    padding: EdgeInsets.symmetric( horizontal: fivePercentWidth(context)),
                    child: Image.asset(
                      'assets/images/Banner.png',
                    ),
                  ),
                  SizedBox(height: 48),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                 child: PustakaIconMenu(
                                    images: 'assets/menu/puskesmas.svg',
                                    title: "Puskesmas",
                                  ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushNamed(PuskesmasMenuScreen.id);
                              },
                            ),

                            InkWell(
                              child: Container(
                                 child: PustakaIconMenu(
                                   images: 'assets/menu/lihatantrian.svg',
                                   title: "Lihat Antrian",
                                 ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushNamed(PuskesmasLihatAntrian.id);
                              },
                            ),

                            InkWell(
                              child: Container(
                                child:    PustakaIconMenu(
                                  images: 'assets/menu/daftarantri.svg',
                                  title: "Daftar Antri",
                                ),
                              ),
                              onTap: (){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Daftar Antri')));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            PustakaIconMenu(
                              images: 'assets/menu/riwayat.svg',
                              title: "Riwayat\nKunjungan",
                            ),
                            PustakaIconMenu(
                              images: 'assets/menu/butawarna.svg',
                              title: "Test Buta\nWarna",
                            ),
                            PustakaIconMenu(
                              images: 'assets/menu/asahotak.svg',
                              title: "Asah Otak",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Artikel Kesehatan',
                            style: kPustakaBlackBoldMedium.copyWith(
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lihat Semua',
                            style:
                            kPustakaGreenRegular.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset('assets/images/bannerartikel2.png', width: 285, height: 220,),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                          Image.asset('assets/images/bannerartikel2.png',width: 285, height: 220),
                        ),
                      ],
                    ),
                  )
                ])
              ],
            ),
          )
      ),

    );
  }
}
