import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/puskesmas_konfirmasi_antrian.dart';

class DaftarDataIdentitas extends StatefulWidget {
  const DaftarDataIdentitas({Key key}) : super(key: key);

  @override
  _DaftarDataIdentitasState createState() => _DaftarDataIdentitasState();
}

class _DaftarDataIdentitasState extends State<DaftarDataIdentitas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
          ),
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: kSurfaceColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: kFontColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text('Data Identitas',
                style: kPustakaBlackRegular.copyWith(fontSize: 19)),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  'Pendaftaran Online Puskesmas',
                  style: kPustakaBlackRegular.copyWith(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  'Silakan Isi dengan lengkap',
                  style: kPustakaBlackRegular.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 328,
                height: 56,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color(0xFFE9E8E8),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.badge,
                        color: Color(0xFFA9A9A9),
                      ),
                      hintText: "Nomor Induk Kependudukan",
                      hintStyle: kPustakaBlackRegular.copyWith(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                width: 328,
                height: 56,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color(0xFFE9E8E8),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.badge,
                        color: Color(0xFFA9A9A9),
                      ),
                      hintText: "Nomor Kartu Berobat",
                      hintStyle: kPustakaBlackRegular.copyWith(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, left: 16, right: 16),
                alignment: Alignment.topLeft,
                child: Text('Klik di sini untuk daftar pasien baru',
                    style: kPustakaGreenRegular.copyWith(fontSize: 13)),
              ),
              Container(
                width: 328,
                height: 56,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color(0xFFE9E8E8),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Color(0xFFA9A9A9),
                      ),
                      hintText: "Nama",
                      hintStyle: kPustakaBlackRegular.copyWith(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                width: 328,
                height: 56,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color(0xFFE9E8E8),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.today_rounded,
                        color: Color(0xFFA9A9A9),
                      ),
                      hintText: "Tanggal Lahir",
                      hintStyle: kPustakaBlackRegular.copyWith(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                width: 328,
                height: 56,
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color(0xFFE9E8E8),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.location_city_rounded,
                        color: Color(0xFFA9A9A9),
                      ),
                      hintText: "Alamat",
                      hintStyle: kPustakaBlackRegular.copyWith(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.6)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                width: 178,
                height: 56,
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>KonfirmasiAntrian()));
                    },
                    child: Text(
                      "Lanjutkan",
                      style: kPustakaWhiteNormal.copyWith(fontSize: 16),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))))),
              ),
            ],
          ),
        ));
  }
}
