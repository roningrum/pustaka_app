import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const.dart';
import '../home/home_screen.dart';

class PustakaButaWarna extends StatefulWidget {
  static String id = 'buta_warna';
  const PustakaButaWarna({Key key}) : super(key: key);

  @override
  _PustakaButaWarnaState createState() => _PustakaButaWarnaState();
}

class _PustakaButaWarnaState extends State<PustakaButaWarna> {
  List<TextSpan> textSpans = <TextSpan>[
    TextSpan(text: 'Tes buta warna adalah pemeriksaan yang dilakukan untuk mengukur kemampuan pasien dalam membedakan warna.\nButa warna tidak selalu ditandai oleh penderita yang hanya mampu melihat warna hitam dan putih. Kebanyakan penderita tidak bisa membedakan beberapa warna, seperti warna merah dan hijau, atau biru dan kuning.', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black54)),
    TextSpan(text: '\nTipe buta warna yang paling sering adalah kesulitan membedakan warna hijau dan merah. Tes buta warna disarankan bagi pasien yang merasa mengalami gangguan dalam membedakan atau melihat warna.', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black54)),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSurfaceColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: kFontColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(HomeScreen.id);
          },
        ),
        title: Text('Test Buta Warna',
            style: kPustakaBlackRegular.copyWith(fontSize: 19)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42),
            child: Center(
                child: SvgPicture.asset('assets/menu/eye.svg', width: 150, height: 150)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Tes Buta Warna untuk Uji Visi warna Mata", style: kPustakaBlackBoldMedium.copyWith(fontSize: 15),),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: RichText(text: TextSpan( children: textSpans), textScaleFactor: 1.0,
              )
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 24, top: 8),
            child: Text("Ayo mainkan untuk menguji seberapa jauh mata kamu mengenal warna", style: kPustakaBlackRegular.copyWith(fontSize: 13),),
          ),
          Container(
            width: 178,
            height: 56,
            margin: EdgeInsets.only(top: 16),
            child: ElevatedButton.icon(
              onPressed: (){},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              icon: Icon(Icons.play_arrow_rounded, color: Color(0xFF006634),),
              label: Text('Mainkan', style: kPustakaWhiteNormal.copyWith(fontSize: 13),),
            ),
          )
        ],
      ),
    );
  }
}
