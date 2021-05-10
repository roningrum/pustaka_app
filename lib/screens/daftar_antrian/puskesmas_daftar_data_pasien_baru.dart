import 'package:flutter/material.dart';
import 'package:pustaka_app/screens/daftar_antrian/puskesmas_konfirmasi_pasien_baru.dart';

import '../../const.dart';

class DaftarPasienBaru extends StatefulWidget {
  final String puskesmasNama;
  const DaftarPasienBaru({Key key, this.puskesmasNama}) : super(key: key);

  @override
  _DaftarPasienBaruState createState() => _DaftarPasienBaruState();
}

class _DaftarPasienBaruState extends State<DaftarPasienBaru> {
  bool value;

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
              Navigator.of(context).pop();
            },
          ),
          title: Text('Konfirmasi Pasien Baru',
              style: kPustakaBlackRegular.copyWith(fontSize: 19))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Text("Pendaftaran Pasien Baru ${widget.puskesmasNama}",
                    style: kPustakaBlackRegular.copyWith(fontSize: 13)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                child: Text("Silakan isi data diri",
                    style: kPustakaBlackRegular.copyWith(fontSize: 13)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56,
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                keyboardType: TextInputType.number,
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
              width: MediaQuery.of(context).size.width,
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
                    hintText: "Nomor Induk Kependudukan",
                    hintStyle: kPustakaBlackRegular.copyWith(
                        fontSize: 15,
                        color: Color(0xFF000000).withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56,
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xFFE9E8E8),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.family_restroom_rounded,
                      color: Color(0xFFA9A9A9),
                    ),
                    hintText: "Nama Kepala Keluarga",
                    hintStyle: kPustakaBlackRegular.copyWith(
                        fontSize: 15,
                        color: Color(0xFF000000).withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18, left: 16, right: 16),
              alignment: Alignment.topLeft,
              child: Text('Alamat KTP (sesuai dengan kartu KTP)',
                  style: kPustakaBlackRegular.copyWith(fontSize: 13)),
            ),
            Container(
             width: MediaQuery.of(context).size.width,
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
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 50,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 56,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xFFE9E8E8),
                            filled: true,
                            hintText: "RT",
                            hintStyle: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Container(
                      height: 56,
                      margin: EdgeInsets.only(right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xFFE9E8E8),
                            filled: true,
                            hintText: "RW",
                            hintStyle: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width:  MediaQuery.of(context).size.width,
              height: 56,
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xFFE9E8E8),
                    filled: true,
                    hintText: "Kelurahan",
                    hintStyle: kPustakaBlackRegular.copyWith(
                        fontSize: 15,
                        color: Color(0xFF000000).withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 16, right: 16),
              alignment: Alignment.topLeft,
              child: Text('Alamat Domisili',
                  style: kPustakaBlackRegular.copyWith(fontSize: 13)),
            ),
            CheckboxListTile(
              activeColor: kPrimaryColor,
                controlAffinity: ListTileControlAffinity.leading,
              title: Text('Alamat KTP sama dengan alamat domisili', style: kPustakaBlackRegular.copyWith(
                  fontSize: 13)),
                value: value != true,
                onChanged: (bool _value) {
                  setState(() {
                    value = _value;
                  });
                }),
            Container(
              width:  MediaQuery.of(context).size.width,
              height: 56,
              margin: EdgeInsets.only(top: 8, left: 16, right: 16),
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
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 50,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 56,
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xFFE9E8E8),
                            filled: true,
                            hintText: "RT",
                            hintStyle: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Container(
                      height: 56,
                      margin: EdgeInsets.only(right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xFFE9E8E8),
                            filled: true,
                            hintText: "RW",
                            hintStyle: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 56,
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xFFE9E8E8),
                    filled: true,
                    hintText: "Kelurahan",
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
              margin: EdgeInsets.only(top: 24, bottom: 32),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>KonfirmasiPasienBaru()));
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
      ),
    );
  }
}
