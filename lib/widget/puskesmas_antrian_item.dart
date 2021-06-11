import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';

class PuskesmasAntrianItem extends StatelessWidget {
  final String nama_loket;
  final String nomor_loket;
  const PuskesmasAntrianItem({Key key, this.nama_loket, this.nomor_loket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
                color: kPrimaryColor, width: 2, style: BorderStyle.solid)),
        elevation: 0,
          child: Container(
            width: 84,
            height: 84,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      nama_loket,
                      style: kPustakaGreenRegular.copyWith(fontSize: 13),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      nomor_loket,
                      style: kPustakaGreenRegular.copyWith(fontSize: 23),
                    ),
                  ),
                ],),
          ),
      ),
    );
  }
}
