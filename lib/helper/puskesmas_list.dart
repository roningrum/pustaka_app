import 'dart:convert';

import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:http/http.dart' as http;

class PuskesmasList {
  List<Puskesmas> puskesmasList = [];

  Future<void> getPuskesmas() async {
    var url = Uri.parse("$PUSTAKA_URL/getSarkes");
    var response = await http.get(url);
    print('Response Puskesmas : ${response.body}');

    var jsonData = jsonDecode(response.body);
    jsonData['sarkes'].forEach((element) {
      Puskesmas puskesmas = Puskesmas(
          id_sarkes: element['id_sarkes'],
          latitude: element['latitude'],
          longitude: element['longitude'],
          nama: element['nama'],
          antrian: element['antrian'],
          telepon: element['telepon'],
          telepon_kantor: element['telepon_kantor'],
          kode: element['kode'],
          foto: element['foto'],
          alamat: element['alamat']);

      puskesmasList.add(puskesmas);
    });
  }
}
