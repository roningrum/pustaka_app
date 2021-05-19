import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/screens/daftar_antrian/puskesmas_daftar_data_pasien_baru.dart';

class DaftarDataIdentitas extends StatefulWidget {
  final Puskesmas puskesmas;

  const DaftarDataIdentitas({Key key, this.puskesmas}) : super(key: key);

  @override
  _DaftarDataIdentitasState createState() => _DaftarDataIdentitasState();
}

class _DaftarDataIdentitasState extends State<DaftarDataIdentitas> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String nik;


  TextEditingController initialDate = TextEditingController();

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1945),
        lastDate: new DateTime(2100));

    if (picked != null)
      setState(() {
        String date = DateFormat("dd-MM-yyyy").format(picked);
        initialDate.text = date;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    initialDate.dispose();
    super.dispose();
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
          key: scaffoldKey,
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
          body: SingleChildScrollView(
            reverse: true,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        'Pendaftaran Online ${widget.puskesmas.nama}',
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
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Tolong isi NIK";
                          } else {
                            if (value.length > 0 && value.length < 16) {
                              return "Digit Nik harus 16 digit";
                            } else if (value.length > 16) {
                              return "Digit Nik lebih 16 digit";
                            }
                          }
                          return null;
                        },
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Color(0xFFE9E8E8),
                            filled: true,
                            counterText: '',
                            prefixIcon: Icon(
                              Icons.badge,
                              color: Color(0xFFA9A9A9),
                            ),
                            hintText: "Nomor Induk Kependudukan",
                            hintStyle: kPustakaBlackRegular.copyWith(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.6)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Isi Kartu berobat";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
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
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2, left: 16, right: 16),
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DaftarPasienBaru(
                                    puskesmasNama: widget.puskesmas.nama,
                                  )));
                        },
                        child: Text('Klik di sini untuk daftar pasien baru',
                            style: kPustakaGreenRegular.copyWith(fontSize: 13)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextFormField(
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
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextFormField(
                        controller: initialDate,
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                          FocusScope.of(context).requestFocus(new FocusNode());
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
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      margin: EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          onPressed: () {
                            new Future.delayed(Duration.zero, () {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                scaffoldKey.currentState
                                    // ignore: deprecated_member_use
                                    .showSnackBar(SnackBar(
                                        content: Text('Processing Data')));
                              }
                            });
                            // Validate returns true if the form is valid, or false otherwise
                          },
                          child: Text(
                            "Lanjutkan",
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
                ),
              ),
            ),
          ),
        ));
  }
}
