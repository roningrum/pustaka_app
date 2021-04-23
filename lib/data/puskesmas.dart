import 'package:flutter/cupertino.dart';

class Puskesmas {
  final String id_sarkes;
  final String latitude;
  final String longitude;
  final String nama;
  final String antrian;
  final String telepon;
  final String telepon_kantor;
  final String kode;
  final String foto;
  final String alamat;

  Puskesmas(
      {@required this.id_sarkes,
      @required this.latitude,
      @required this.longitude,
      @required this.nama,
      @required this.antrian,
      @required this.telepon,
      @required this.telepon_kantor,
      @required this.kode,
      @required this.foto,
      @required this.alamat});
}
