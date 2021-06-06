class Antrian {
  String loketA;
  String loketB;
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

  Antrian(
      this.loketA,
      this.loketB);
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

  Antrian.fromJson(Map<String, dynamic> json)
      : loketA = json['Loket A'],
        loketB = json['Loket B'];

  Map<String, dynamic> toJson() =>{
    'Loket A' : loketA,
    'Loket B' : loketB
  };

}
