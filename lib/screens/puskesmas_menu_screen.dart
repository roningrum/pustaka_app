import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/helper/puskesmas_list.dart';
import 'package:pustaka_app/screens/puskesmas_detail_page.dart';
import 'package:pustaka_app/screens/puskesmas_peta.dart';
import 'package:pustaka_app/screens/puskesmas_search.dart';
import 'package:pustaka_app/widget/loading_puskesmas_widget.dart';
import 'package:pustaka_app/widget/puskesmas_item_list.dart';
import '../const.dart';
import 'home_screen.dart';

class PuskesmasMenuScreen extends StatefulWidget {
  static String id = "puskesmas_menu";

  @override
  _PuskesmasMenuScreenState createState() => _PuskesmasMenuScreenState();
}

class _PuskesmasMenuScreenState extends State<PuskesmasMenuScreen> {
  bool _loading;
  var sarkesList;

  void getPuskesmas() async {
    PuskesmasList puskesmasItem = PuskesmasList();
    await puskesmasItem.getPuskesmas();
    sarkesList = puskesmasItem.puskesmasList;
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        if (sarkesList.length != 0) {
          _loading = false;
          print("Data ada");
        } else {
          _loading = false;
          print("Data tidak ada");
        }
      });
      timer.cancel();
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    getPuskesmas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kSurfaceColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kFontColor,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.id);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined, color: kFontColor),
              onPressed: () {
                Navigator.of(context).pushNamed(PuskesmasSearch.id);
              },
            ),
            IconButton(
              icon: Icon(Icons.location_on_outlined, color: kFontColor),
              onPressed: () {
                Navigator.of(context).pushNamed(PuskesmasPeta.id);
              },
            ),
          ],
          title: Text('Puskesmas',
              style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
        ),
        body: _loading
            ? LoadingPuskesmas()
            : SingleChildScrollView(
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                          itemCount: sarkesList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PuskesmasDetail(
                                              puskesmas: sarkesList[index],
                                            )));
                                print('data ${sarkesList[index]}');
                              },
                              child: PuskesmasItemList(
                                foto: sarkesList[index].foto ?? "",
                                nama: sarkesList[index].nama ?? "",
                                alamat: sarkesList[index].alamat ?? "",
                              ),
                            );
                          }),
                    )
                  ],
                )),
              ));
  }
}
