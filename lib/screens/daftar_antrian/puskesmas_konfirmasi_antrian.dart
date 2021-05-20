import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/success_message.dart';
import 'package:pustaka_app/widget/custom_dialog_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class KonfirmasiAntrian extends StatefulWidget {
  @override
  _KonfirmasiAntrianState createState() => _KonfirmasiAntrianState();
}

class _KonfirmasiAntrianState extends State<KonfirmasiAntrian> {
  String _jenisPembayaran,
      _chosenPoli,
      tglPerikssa,
      tglLahirPasien, namaPasien, alamatPasien, nomorKartuObat, nikPasien, nomorPuskesmas;


  TextEditingController tglPeriksa = TextEditingController();

  _panggilData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namaPasien = prefs.getString('nama');
    alamatPasien = prefs.getString('alamat');
    nikPasien = prefs.getString('nik');
    nomorKartuObat = prefs.getString('kartu_obat');
    tglLahirPasien = prefs.getString('tglLahir');
    nomorPuskesmas = prefs.getString('nomorPuskesmas');
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1945),
        lastDate: new DateTime(2100));

    if (picked != null)
      setState(() {
        String date = DateFormat("dd-MM-yyyy").format(picked);
        tglPeriksa.text = date;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    _panggilData();
  }
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
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextFormField(
                controller: tglPeriksa,
                readOnly: true,
                onTap: (){
                  _selectDate();
                },
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
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Container(
                    width: 280,
                    height: 56,
                    padding: EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Color(0xFFE9E8E8),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color(0xFFE9E8E8)),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: Stack(children: [
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: DropdownButton<String>(
                          iconSize: 24,
                          isExpanded: true,
                          value: _chosenPoli,
                          underline: SizedBox(),
                          onChanged: (String value) {
                            setState(() {
                              _chosenPoli = value;
                              Text(_chosenPoli, style: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6),
                              ));
                            });

                          },
                          hint: Text("Poli",
                              style: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6),
                              )),
                          items: <String>[
                            "Umum",
                            "Gigi",
                            "KIA",
                            "MTBS"
                          ].map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          Icons.local_hospital_rounded,
                          color: Color(0xFFA9A9A9),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24),
                    alignment: Alignment.center,
                    child: IconButton(
                        iconSize: 32,
                        icon: Icon(Icons.help_rounded,
                            color: kPrimaryColor.withOpacity(0.5)),
                        onPressed: () {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(
                                  title: "Info Poli",
                                  descriptions: "Umum : Poli untuk penyakit umum \n\n Gigi : Poli Gigi \n\n KIA (Kesehatan Ibu Anak) : Poli untuk kesehatan ibu dan anak \n\n MTBS (Manajemen Terpadu Balita Sakit) : Poli untuk balita sakit",
                                  text: "Yes",
                                );
                              }
                          );
                        }),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 16, bottom: 8),
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
                        color: Color(0xFFE9E8E8),
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: RadioListTile(
                    activeColor: kPrimaryColor,
                    value: "BPJS",
                    groupValue: _jenisPembayaran,
                    onChanged: (String value) {
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
                                  child: SvgPicture.asset(
                                      'assets/menu/bpjslogo.svg'))),
                          WidgetSpan(
                              child: Container(
                                margin: EdgeInsets.only(left: 12),
                                child: Text(
                                  "BPJS",
                                  style: kPustakaBlackBoldMedium.copyWith(
                                      fontSize: 15),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E8E8),
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: RadioListTile(
                    activeColor: kPrimaryColor,
                    value: "Umum",
                    groupValue: _jenisPembayaran,
                    onChanged: (String value) {
                      setState(() {
                        _jenisPembayaran = value;
                        print('$_jenisPembayaran');
                      });
                    },
                    title: Container(
                      padding: EdgeInsets.all(4),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                                child: Container(
                              child: Icon(Icons.account_balance_wallet_rounded,
                                  color: Color(0xFFA9A9A9)),
                            )),
                            WidgetSpan(
                                child: Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Text(
                                "Umum",
                                style: kPustakaBlackBoldMedium.copyWith(
                                    fontSize: 15),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 178,
                  height: 56,
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                      onPressed: () {
                        _openWhatsapp();
                      },
                      child: Text(
                        "Daftar",
                        style: kPustakaWhiteNormal.copyWith(fontSize: 16),
                      ),
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(16)),
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void _openWhatsapp() async{
    var text = "$nikPasien # $nomorKartuObat # $namaPasien # $tglLahirPasien # $alamatPasien # $_chosenPoli # $tglPerikssa # $_jenisPembayaran";
    var nomor = nomorPuskesmas;
    final urlWA = "http://api.whatsapp.com/send?phone=$nomor&text=$text";
    await launch(urlWA);
  }
}

