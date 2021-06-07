import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/home/home_screen.dart';

class AsahOtak extends StatefulWidget {
  static String id = 'asah_otak';
  const AsahOtak({Key key}) : super(key: key);

  @override
  _AsahOtakState createState() => _AsahOtakState();
}

class _AsahOtakState extends State<AsahOtak> {
  List<TextSpan> textSpans = <TextSpan>[
    TextSpan(text: 'Manfaat permainan asah otak antara lain:', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black38)),
    TextSpan(text: '\n1. Mengasah kemampuan memecahkan masalah', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black38)),
    TextSpan(text: '\n2. Meningkatkan rasa percaya diri', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black38)),
    TextSpan(text: '\n3. Mengasah kemampuan motorik', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black38)),
    TextSpan(text: '\n4. Meningkatkan kemampuan koordinasi', style: kPustakaBlackRegular.copyWith(fontSize: 13, color : Colors.black38)),
    TextSpan(text: '\n5. Membantu mengasah memori', style: kPustakaBlackRegular.copyWith(fontSize: 13, color: Colors.black38))
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
        title: Text('Asah Otak',
            style: kPustakaBlackRegular.copyWith(fontSize: 19)),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 42),
              child: Center(
                  child: SvgPicture.asset('assets/images/asahotak.svg', width: 150, height: 150)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Asah otakmu dengan puzzle", style: kPustakaBlackRegular.copyWith(fontSize: 15),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: RichText(text: TextSpan( children: textSpans), textScaleFactor: 1.0,
              )
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 24, top: 8),
              child: Text("Ayo main permainan puzzle", style: kPustakaBlackRegular.copyWith(fontSize: 13),),
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
      ),
    );
  }
}
