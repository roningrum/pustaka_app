import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pustaka_app/helper/puskesmas_list.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian_detail.dart';
import 'package:pustaka_app/screens/lihat_antrian/pusksesmas_search_lihat_antrian.dart';
import 'package:pustaka_app/widget/loading_puskesmas_widget.dart';
import 'package:pustaka_app/widget/puskesmas_antri_list.dart';

import '../../const.dart';
import '../home_screen.dart';

class PuskesmasLihatAntrian extends StatefulWidget {
  static String id = 'Puskesmas Lihat Antrian';

  const PuskesmasLihatAntrian({Key key}) : super(key: key);

  @override
  _PuskesmasLihatAntrianState createState() => _PuskesmasLihatAntrianState();
}

class _PuskesmasLihatAntrianState extends State<PuskesmasLihatAntrian> {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PuskesmasSearchLihatAntrian()));
              },
            )
          ],
          title: Text('Lihat Antrian',
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
                                        builder: (context) => PuskesmasAntrianDetail(
                                          puskesmas: sarkesList[index],
                                        )));
                              },
                              child: PuskesmasAntriList(
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
