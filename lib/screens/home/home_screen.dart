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
                 // Container(
                 //   child: Row(
                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //     children: <Widget>[
                 //       Padding(
                 //         padding: const EdgeInsets.all(16.0),
                 //         child: Text(
                 //           'Artikel Kesehatan',
                 //           style: kPustakaBlackBoldMedium.copyWith(
                 //               fontSize: 15),
                 //         ),
                 //       ),
                 //       Padding(
                 //         padding: const EdgeInsets.all(8.0),
                 //         child: Text(
                 //           'Lihat Semua',
                 //           style:
                 //           kPustakaGreenRegular.copyWith(fontSize: 12),
                 //         ),
                 //       ),
                 //     ],
                 //   ),
                 // ),
                 // Container(
                 //   height: 200.0,
                 //   child: ListView(
                 //     scrollDirection: Axis.horizontal,
                 //     children: <Widget>[
                 //       Padding(
                 //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                 //         child: Image.asset('assets/images/bannerartikel2.png', width: 285, height: 220,),
                 //       ),
                 //       Padding(
                 //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                 //         child:
                 //         Image.asset('assets/images/bannerartikel2.png',width: 285, height: 220),
                 //       ),
                 //     ],
                 //   ),
                 // )
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
