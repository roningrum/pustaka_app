import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pustaka_app/const.dart';

class KonfirmasiPasienBaru extends StatefulWidget {
  const KonfirmasiPasienBaru({Key key}) : super(key: key);

  @override
  _KonfirmasiPasienBaruState createState() => _KonfirmasiPasienBaruState();
}

class _KonfirmasiPasienBaruState extends State<KonfirmasiPasienBaru> {
  JenisKelamin _jenisKelamin = JenisKelamin.Male;
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
                child: Text("Konfirmasi Pendaftaran Pasien Baru",
                    style: kPustakaBlackRegular.copyWith(fontSize: 13)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                child: Text("Silakan isi dengan lengkap",
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
                      Icons.contacts_rounded,
                      color: Color(0xFFA9A9A9),
                    ),
                    hintText: "No. Telepon Pasien",
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
                      Icons.child_care_rounded,
                      color: Color(0xFFA9A9A9),
                    ),
                    hintText: "Tempat lahir",
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
                readOnly: true,
                onTap: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2200));
                },
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
              margin: EdgeInsets.only(top: 18, left: 16, right: 16),
              alignment: Alignment.topLeft,
              child: Text('Jenis Kelamin',
                  style: kPustakaBlackRegular.copyWith(fontSize: 13)),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 50,
                    child: RadioListTile(
                      activeColor: kPrimaryColor,
                      value: JenisKelamin.Male,
                      groupValue: _jenisKelamin,
                      onChanged: (JenisKelamin value) {
                        setState(() {
                          _jenisKelamin = value;
                          print(value);
                        });
                      },
                      title: Text(
                        "Laki-Laki",
                        style: kPustakaBlackRegular.copyWith(fontSize: 13),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: RadioListTile(
                        activeColor: kPrimaryColor,
                        value: JenisKelamin.Female,
                        groupValue: _jenisKelamin,
                        onChanged: (JenisKelamin value) {
                          setState(() {
                            _jenisKelamin = value;
                            print(value);
                          });
                        },
                        title: Text(
                          "Perempuan",
                          style: kPustakaBlackRegular.copyWith(fontSize: 13),
                        )),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56,
              margin: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xFFE9E8E8),
                    filled: true,
                    prefixIcon: SvgPicture.asset('assets/menu/bloodtype_black_24dp.svg', color: Color(0xFFA9A9A9),),
                    hintText: "Golongan Darah",
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
                    prefixIcon: Icon(Icons.badge),
                    fillColor: Color(0xFFE9E8E8),
                    filled: true,
                    hintText: "Nomor BPJS",
                    hintStyle: kPustakaBlackRegular.copyWith(
                        fontSize: 15,
                        color: Color(0xFF000000).withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 2,left: 16),
              child: Text("*jika tidak punya BPJS, tidak usah diisi",
                  style: kPustakaBlackRegular.copyWith(fontSize: 12, color: Colors.green[500]), textAlign: TextAlign.start,),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56,
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.work),
                    fillColor: Color(0xFFE9E8E8),
                    filled: true,
                    hintText: "Pekerjaan",
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
                  onPressed: () {},
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
        ),
      ),
    );
  }
}

enum JenisKelamin { Male, Female }
