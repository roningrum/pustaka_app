import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/puskesmas.dart';

class DaftarDataIdentitas extends StatefulWidget {
  final Puskesmas puskesmas;
  const DaftarDataIdentitas({Key key, this.puskesmas}) : super(key: key);

  @override
  _DaftarDataIdentitasState createState() => _DaftarDataIdentitasState();
}

class _DaftarDataIdentitasState extends State<DaftarDataIdentitas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kSurfaceColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Data Identitas', style: kPustakaGreenMedium.copyWith(fontSize: 19)),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text('Pendaftaran Online ${widget.puskesmas.nama}', style: kPustakaBlackRegular.copyWith(
                fontSize: 13), textAlign: TextAlign.center,),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text('Pendaftaran Online ${widget.puskesmas.nama}', style: kPustakaBlackRegular.copyWith(
                  fontSize: 13), textAlign: TextAlign.center,),
            ),
            TextFormField(
              initialValue: 'Nomor Induk Kependudukan',
              maxLength: 16,
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                icon: Icon(Icons.badge),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor)
                )
              ),
            ),
            TextFormField(
              initialValue: 'Nomor Kartu Obat',
              decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  icon: Icon(Icons.badge),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text('Klik di sini untuk daftar pasien baru', style: kPustakaBlackRegular.copyWith(
                  fontSize: 13), textAlign: TextAlign.center,),
            ),
            TextFormField(
              initialValue: 'Nama',
              decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  icon: Icon(Icons.person_rounded),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)
                  )
              ),
            ),
            TextFormField(
              initialValue: 'Tanggal Lahir',
              decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  icon: Icon(Icons.today_rounded),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)
                  )
              ),
            ),
            TextFormField(
              initialValue: 'Alamat',
              decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  icon: Icon(Icons.location_city_rounded),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)
                  )
              ),
            ),
          ],
        ),
      )
    );
  }
}
