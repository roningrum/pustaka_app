import 'package:flutter/material.dart';

class Antrian{
  String nik;
  String name;
  String tglPeriksa;
  String poli;

  Antrian({
    @required this.nik,
    @required this.name,
    @required this.tglPeriksa,
    @required this.poli});

  Map<String, dynamic> toMap(){
    return {
      'nik' : nik,
      'name' : name,
      'tglPeriksa' : tglPeriksa,
      'poli' : poli
    };
  }

  String toString(){
    return 'Antrian{nik : $nik, name: $name, tglPeriksa: $tglPeriksa, poli: $poli}';
  }

}