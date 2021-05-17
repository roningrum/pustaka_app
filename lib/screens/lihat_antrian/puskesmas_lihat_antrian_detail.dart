import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/antrian.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian.dart';
import 'package:pustaka_app/widget/puskesmas_antrian_item.dart';
import 'package:http/http.dart' as http;



class PuskesmasAntrianDetail extends StatefulWidget {
  final Puskesmas puskesmas;

  const PuskesmasAntrianDetail({Key key, this.puskesmas}) : super(key: key);


  @override
  _PuskesmasAntrianDetailState createState() => _PuskesmasAntrianDetailState();
}

class _PuskesmasAntrianDetailState extends State<PuskesmasAntrianDetail> {

  Future<Antrian> getAntrian() async{
    var url = Uri.parse(widget.puskesmas.antrian);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return Antrian.fromJson(jsonData['antrian']);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAntrian();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kSurfaceColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kFontColor,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(PuskesmasLihatAntrian.id);
            },
          ),
          title: Text('Status Antrian',
              style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Center(
              child: Text("Status Antrian Puskesmas ${widget.puskesmas.nama}",
                  style: kPustakaBlackRegular.copyWith(fontSize: 13)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Loket',
                    style: kPustakaBlackBoldMedium.copyWith(fontSize: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FutureBuilder(future: getAntrian(),builder: (context, snapshot){
                      if(snapshot.hasData){
                        print(snapshot.data.loketA);
                        return  PuskesmasAntrianItem(nama_loket: "Loket A", nomor_loket: snapshot.data.loketA);}
                    return Container(width: 0.0, height: 0.0,);
                    })

                  ],
                ),
                Text('Poli',
                    style: kPustakaBlackBoldMedium.copyWith(fontSize: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
