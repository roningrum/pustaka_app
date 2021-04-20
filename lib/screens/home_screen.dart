import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/widget/pustaka_icon_menu.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAppbar = true;
  bool isScrollingDown = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isScrollingDown = true;
        _isAppbar = false;
        setState(() {});
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _isAppbar = true;
          setState(() {});
        }
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurfaceColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              height: _isAppbar ? 56.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: AppBar(
                title: Text('Pustaka'),
              ),
            ),

            Expanded(
                child: SingleChildScrollView(
              controller: _scrollController,
              child: Stack(
                children: <Widget>[
                  Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 16.0 + MediaQuery.of(context).viewPadding.top,
                          bottom: fivePercentWidth(context)),
                      child: Center(
                        child: Text(
                          'Pustaka',
                          style: kPustakaBlackBoldMedium.copyWith(fontSize: 19),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: fivePercentWidth(context),
                          right: fivePercentWidth(context)),
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
                              PustakaIconMenu(
                                images: 'assets/menu/puskesmas.svg',
                                title: "Puskesmas",
                              ),
                              PustakaIconMenu(
                                images: 'assets/menu/lihatantrian.svg',
                                title: "Lihat Antrian",
                              ),
                              PustakaIconMenu(
                                images: 'assets/menu/daftarantri.svg',
                                title: "Daftar Antri",
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
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      height: 200.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                Image.asset('assets/images/bannerartikel.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                Image.asset('assets/images/bannerartikel2.png'),
                          ),
                        ],
                      ),
                    )
                  ])
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }
}
