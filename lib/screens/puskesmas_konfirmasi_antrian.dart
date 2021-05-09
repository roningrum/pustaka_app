import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pustaka_app/const.dart';

class KonfirmasiAntrian extends StatefulWidget {
  @override
  _KonfirmasiAntrianState createState() => _KonfirmasiAntrianState();
}

class _KonfirmasiAntrianState extends State<KonfirmasiAntrian> {
  Pembayaran _jenisPembayaran = Pembayaran.BPJS;

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
          title: Text('Konfirmasi',
              style: kPustakaBlackRegular.copyWith(fontSize: 19)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                'Konfirmasi Tujuan Poli dan Tanggal Periksa',
                style: kPustakaBlackRegular.copyWith(fontSize: 13),
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
                    hintText: "Tanggal Periksa",
                    hintStyle: kPustakaBlackRegular.copyWith(
                        fontSize: 15,
                        color: Color(0xFF000000).withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 280,
                  height: 56,
                  margin: EdgeInsets.only(top: 16, left: 16),
                  color: Color(0xFFE9E8E8),
                  padding: EdgeInsets.all(16),
                  child: Stack(children: [
                    Container(
                      margin: EdgeInsets.only(left: 48),
                      child: DropdownButton(
                        iconSize: 24,
                        isExpanded: true,
                        value: null,
                        underline: SizedBox(),
                        onChanged: (value) {},
                        hint: Text("Poli",
                            style: kPustakaBlackRegular.copyWith(
                              fontSize: 15,
                              color: Color(0xFF000000).withOpacity(0.6),
                            )),
                        items: [],
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.local_hospital_rounded,
                        color: Color(0xFFA9A9A9),
                      ),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, right: 16),
                  alignment: Alignment.center,
                  child: IconButton(
                      iconSize: 32,
                      icon: Icon(Icons.help_rounded,
                          color: kPrimaryColor.withOpacity(0.5)),
                      onPressed: () {}),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 16),
              child: Text(
                'Konfirmasi Pembayaran',
                style: kPustakaBlackRegular.copyWith(fontSize: 13),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:  Color(0xFFE9E8E8),
                    ), 
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: RadioListTile(
                    activeColor: kPrimaryColor,
                      value: Pembayaran.BPJS,
                      groupValue: _jenisPembayaran,
                      onChanged:(Pembayaran value){
                        setState(() {
                          _jenisPembayaran = value;
                          print('$_jenisPembayaran');
                        });
                      },
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Container(
                              margin: EdgeInsets.only(right: 12),
                              child: SvgPicture.asset('assets/menu/bpjslogo.svg'))
                        ),
                        TextSpan(
                           text: "BPJS", style: kPustakaBlackBoldMedium.copyWith(
                            fontSize: 14
                        ))
                      ],
                    ),
                  ),),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color:  Color(0xFFE9E8E8),
                      ),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: RadioListTile(
                    activeColor: kPrimaryColor,
                      value: Pembayaran.Umum,
                      groupValue: _jenisPembayaran,
                      onChanged:(Pembayaran value){
                        setState(() {
                          _jenisPembayaran = value;
                          print('$_jenisPembayaran');
                        });
                      },
                  title: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              child: Icon(
                                  Icons.account_balance_wallet_rounded,
                                      color: Color(0xFFA9A9A9)),
                            )
                          ),
                          TextSpan(
                             text: "Umum", style: kPustakaBlackBoldMedium.copyWith(
                            fontSize: 14
                          ))
                        ],
                      ),
                    ),
                  ),),
                Container(
                  width: 178,
                  height: 56,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>KonfirmasiAntrian()));
                      },
                      child: Text(
                        "Daftar",
                        style: kPustakaWhiteNormal.copyWith(fontSize: 16),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum Pembayaran { BPJS, Umum }
