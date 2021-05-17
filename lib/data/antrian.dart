import 'package:flutter/foundation.dart';

class Antrian {
  final String loketA;
  final String loketB;
  final String loketC;
  final String loketV;
  final String umum;
  final String gigi;
  final String kia;
  final String mtbs;
  final String lansia;
  final String imunisasi;
  final String mata;
  final String prolanis;
  final String tb_paru;
  final String igd;
  final String dots;
  final String dot;
  final String konseling;
  final String febris;
  final String konselingGizi;

  Antrian(
      {@required this.loketA,
      @required this.loketB,
      this.loketC,
      this.loketV,
      this.umum,
      this.gigi,
      this.kia,
      this.mtbs,
      this.lansia,
      this.imunisasi,
      this.mata,
      this.prolanis,
      this.tb_paru,
      this.igd,
      this.dots,
      this.dot,
      this.konseling,
      this.febris,
      this.konselingGizi});

  factory Antrian.fromJson(Map<String, dynamic> json) {
    return Antrian(
      loketA: json['Loket A'],
      loketB: json['Loket B'],
      loketC: json['Loket C'],
      loketV: json['Loket V'],
      umum: json['umum'],
      gigi: json['gigi'],
      kia: json['kia'],
      mtbs: json['mtbs'],
      lansia: json['lansia'],
      konselingGizi: json['Konseing Gizi'],
      imunisasi: json['imunisasi'],
      mata: json['mata'],
      prolanis: json['Prolanis'],
      tb_paru: json['tb paru'],
      konseling: json['konseling'],
      igd: json['igd'],
      dots: json['dots'],
      dot: json['dot'],
    );
  }
}
