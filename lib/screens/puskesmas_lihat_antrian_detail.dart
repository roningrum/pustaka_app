import 'package:flutter/material.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/screens/puskesmas_lihat_antrian.dart';
import 'package:pustaka_app/widget/puskesmas_antrian_item.dart';

import '../const.dart';

class PuskesmasAntrianDetail extends StatelessWidget {
  final Puskesmas puskesmas;

  const PuskesmasAntrianDetail({Key key, this.puskesmas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text("Status Antrian Puskesmas ${puskesmas.nama}",
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
                  PuskesmasAntrianItem(),
                  PuskesmasAntrianItem(),
                ],
              ),
              Text('Poli',
                  style: kPustakaBlackBoldMedium.copyWith(fontSize: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PuskesmasAntrianItem(),
                  PuskesmasAntrianItem(),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
