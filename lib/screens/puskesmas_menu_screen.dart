import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/helper/puskesmas_list.dart';
import 'package:pustaka_app/widget/puskesmas_item_list.dart';
import '../const.dart';

class PuskesmasMenuScreen extends StatefulWidget {
  static String id = "puskesmas_menu";
  @override
  _PuskesmasMenuScreenState createState() => _PuskesmasMenuScreenState();
}

class _PuskesmasMenuScreenState extends State<PuskesmasMenuScreen> {
  bool _loading;
  var sarkesList;

  void getPuskesmas() async{
   PuskesmasList puskesmasItem = PuskesmasList();
   await puskesmasItem.getPuskesmas();
   sarkesList = puskesmasItem.puskesmasList;
   Timer.periodic(const Duration(seconds: 5), (timer) {
     setState(() {
       if(sarkesList.length != 0){
         _loading = false;
         print("Data ada");
       }
       else{
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
      title: Text('Puskesmas',  style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
    ),
      body: _loading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryColor,
          strokeWidth: 2,
        ),
      ): SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: ListView.builder(
                    itemCount: sarkesList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PuskesmasItemList(
                        foto: sarkesList[index].foto ?? "",
                        nama : sarkesList[index].nama ?? "",
                        alamat: sarkesList[index].alamat ?? "",
                      );
                    }),
              )
            ],
          )
        ),
      )

    );
  }
}
