

import 'package:flutter/foundation.dart';

class Antrian {
  final String loketA;
  final String loketB;
  // String loketC;
  // String loketV;
  // String umum;
  // String gigi;
  // String kia;
  // String mtbs;
  // String lansia;
  // String imunisasi;
  // String mata;
  // String prolanis;
  // String tb_paru;
  // String igd;
  // String dots;
  // String dot;
  // String konseling;
  // String febris;
  // String konselingGizi;

  Antrian({
      @required this.loketA,
      @required this.loketB});
      // this.loketC,
      // this.loketV,
      // this.umum,
      // this.gigi,
      // this.kia,
      // this.mtbs,
      // this.lansia,
      // this.imunisasi,
      // this.mata,
      // this.prolanis,
      // this.tb_paru,
      // this.igd,
      // this.dots,
      // this.dot,
      // this.konseling,
      // this.febris,
      // this.konselingGizi);

  factory Antrian.fromJson(Map<String, dynamic> json){
    return Antrian(
      loketA : json['Loket A'],
      loketB: json['Loket B']
    );
  }

}
