import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/antrian.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian.dart';
import 'package:pustaka_app/widget/puskesmas_antrian_item.dart';
import 'package:shimmer/shimmer.dart';

class PuskesmasAntrianDetail extends StatefulWidget {
  final Puskesmas puskesmas;

  const PuskesmasAntrianDetail({Key key, this.puskesmas}) : super(key: key);

  @override
  _PuskesmasAntrianDetailState createState() => _PuskesmasAntrianDetailState();
}

class _PuskesmasAntrianDetailState extends State<PuskesmasAntrianDetail> {
  Future<Antrian> getAntrian() async {
    var url = Uri.parse(widget.puskesmas.antrian);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return Antrian.fromJson(jsonData['antrian']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), (){
      getAntrian();
    });
    print("${widget.puskesmas.antrian}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kSurfaceColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kFontColor,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(PuskesmasLihatAntrian.id);
            },
          ),
          title: Text('Status Antrian',
              style: kPustakaBlackBoldMedium.copyWith(fontSize: 19)),
        ),
        body: SingleChildScrollView(
          child: Wrap(children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Text("Status Antrian Puskesmas ${widget.puskesmas.nama}",
                    style: kPustakaBlackRegular.copyWith(fontSize: 13)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 16, left: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Loket',
                          style:
                              kPustakaBlackBoldMedium.copyWith(fontSize: 15)),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      print(snapshot.data.loketA);
                                      return PuskesmasAntrianItem(
                                          nama_loket: "Loket A",
                                          nomor_loket: snapshot.data.loketA);
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      print(snapshot.data.loketB);
                                      return PuskesmasAntrianItem(
                                          nama_loket: "Loket B",
                                          nomor_loket: snapshot.data.loketB);
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.loketC != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Loket C",
                                            nomor_loket: snapshot.data.loketC);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.loketV != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Loket V",
                                            nomor_loket: snapshot.data.loketV);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                        ],
                      ),
                      Text('Poli',
                          style:
                              kPustakaBlackBoldMedium.copyWith(fontSize: 15)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.umum != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Umum",
                                            nomor_loket: snapshot.data.umum);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.gigi != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Gigi",
                                            nomor_loket: snapshot.data.gigi);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.kia != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "KIA",
                                            nomor_loket: snapshot.data.kia);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.mtbs != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "MTBS",
                                            nomor_loket: snapshot.data.mtbs);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.lansia != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Lansia",
                                            nomor_loket: snapshot.data.lansia);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.imunisasi != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Imunisasi",
                                            nomor_loket:
                                                snapshot.data.imunisasi);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.mata != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Mata",
                                            nomor_loket: snapshot.data.mata);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.prolanis != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Prolanis",
                                            nomor_loket:
                                                snapshot.data.prolanis);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.tb_paru != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "TB Paru",
                                            nomor_loket: snapshot.data.tb_paru);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.igd != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "IGD",
                                            nomor_loket: snapshot.data.igd);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.dots != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "DOT",
                                            nomor_loket: snapshot.data.dots);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.dot != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "DOTS",
                                            nomor_loket: snapshot.data.dot);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.konseling != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Konseling",
                                            nomor_loket:
                                                snapshot.data.konseling);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                              FutureBuilder(
                                  future: getAntrian(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.konselingGizi != null) {
                                        return PuskesmasAntrianItem(
                                            nama_loket: "Konseling Gizi",
                                            nomor_loket:
                                                snapshot.data.konselingGizi);
                                      } else {
                                        return emptyDataWidget();
                                      }
                                    }
                                    return loadingDataAntrianWidget();
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ])),
          ]),
        ),
      ),
    );
  }

  Widget emptyDataWidget() {
    return Container(width: 84.0, height: 84.0);
  }

  Widget loadingDataAntrianWidget() {

    return Shimmer.fromColors(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
            width: 84, height: 84, color: Colors.black26),
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100]);
  }
}
