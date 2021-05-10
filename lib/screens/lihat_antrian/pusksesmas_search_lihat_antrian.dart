import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/helper/puskesmas_list.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian_detail.dart';
import 'package:pustaka_app/widget/puskesmas_antri_list.dart';

class PuskesmasSearchLihatAntrian extends StatefulWidget {
  const PuskesmasSearchLihatAntrian({Key key}) : super(key: key);

  @override
  _PuskesmasSearchLihatAntrianState createState() => _PuskesmasSearchLihatAntrianState();
}

class _PuskesmasSearchLihatAntrianState extends State<PuskesmasSearchLihatAntrian> {
  List<Puskesmas> sarkesList = [];
  List<Puskesmas> _searchResult = [];


  TextEditingController searchController = TextEditingController();

  void getPuskesmas() async {
    PuskesmasList puskesmasItem = PuskesmasList();
    await puskesmasItem.getPuskesmas();
    sarkesList = puskesmasItem.puskesmasList;
    setState(() {
      if (sarkesList.length != 0) {
        print("Data ada");
      } else {
        print("Data tidak ada");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getPuskesmas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Container(
                width: 290,
                height: 55,
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  autocorrect: true,
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Type Text Here...',
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: kPustakaBlackBoldMedium.copyWith(
                        fontSize: 15,
                        color: Color(0xFF4D4D4D).withOpacity(0.5)),
                    filled: true,
                    fillColor: Color(0xFFE9E8E8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                      BorderSide(color: Colors.transparent, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                      BorderSide(color: Colors.transparent, width: 1),
                    ),
                  ),
                  onChanged: (txt) {
                    _searchResult.clear();
                    if(txt.isEmpty){
                      setState(() {
                      });
                      return;
                    }
                    sarkesList.forEach((puskesmas) {
                      if(puskesmas.nama.toLowerCase().contains(txt) || puskesmas.nama.contains(txt)){
                        _searchResult.add(puskesmas);
                      }
                    });
                    setState(() {});
                  },
                ))),
        body: Column(
            children : <Widget>[
              Expanded(
                  child: _searchResult.length !=0 || searchController.text.isNotEmpty ?ListView.builder(
                      itemCount: _searchResult.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PuskesmasAntrianDetail(
                                      puskesmas: _searchResult[index],
                                    )));
                            print('data ${_searchResult[index]}');
                          },
                          child: PuskesmasAntriList(
                            foto: _searchResult[index].foto ?? "",
                            nama: _searchResult[index].nama ?? "",
                            alamat: _searchResult[index].alamat ?? "",
                          ),
                        );
                      }):
                  ListView.builder(
                      itemCount: sarkesList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PuskesmasAntrianDetail(
                                      puskesmas: sarkesList[index],
                                    )));
                            print('data ${sarkesList[index]}');
                          },
                          child: PuskesmasAntriList(
                            foto: sarkesList[index].foto ?? "",
                            nama: sarkesList[index].nama ?? "",
                            alamat: sarkesList[index].alamat ?? "",
                          ),
                        );
                      })

              ),
            ]));
  }
}
