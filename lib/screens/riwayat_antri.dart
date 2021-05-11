import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/home_screen.dart';

class RiwayatKunjunganPuskesmas extends StatefulWidget {
  static String id = "riwayatKunjunganPuskesmas";
  const RiwayatKunjunganPuskesmas({Key key}) : super(key: key);

  @override
  _RiwayatKunjunganPuskesmasState createState() => _RiwayatKunjunganPuskesmasState();
}

class _RiwayatKunjunganPuskesmasState extends State<RiwayatKunjunganPuskesmas> {
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
        title: Text('Riwatat Kunjungan',
            style: kPustakaBlackRegular.copyWith(fontSize: 19)),
      ),
    );
  }
}
