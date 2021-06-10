import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/widget/Constants.dart';

import '../const.dart';

class UnderDevelopmentNotice extends StatefulWidget {
  const UnderDevelopmentNotice({Key key}) : super(key: key);

  @override
  _UnderDevelopmentNoticeState createState() => _UnderDevelopmentNoticeState();
}

class _UnderDevelopmentNoticeState extends State<UnderDevelopmentNotice> {
  bool _showBottomSheet = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _showBottomSheet ? BottomSheet(
          onClosing: () {},
          builder: (BuildContext ctx) =>
              Container(
                width: double.infinity,
                height: 250,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/develop.svg', fit: BoxFit.contain),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                        child: Text("Maaf Sedang dalam Pengembangan",
                          style: kPustakaBlackBoldMedium.copyWith(fontSize: 16,
                              letterSpacing: 0.25, height: 1.0),
                          textAlign: TextAlign.start,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Text("Fitur yang kamu akses sedang dalam tahap pengembangan.\nMohon tunggu di versi pembaruan selanjutnya",
                        style: kPustakaBlackRegular.copyWith(fontSize: 12,
                            letterSpacing: 0.25),
                        textAlign: TextAlign.start,),
                    ),
                    Container()
                  ],
                ),
              )
      ) : Container(),
    );
  }
}
