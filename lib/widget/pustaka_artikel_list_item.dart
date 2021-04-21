import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';

class PustakaArtikelListItem extends StatefulWidget {
  @override
  _PustakaArtikelListItemState createState() => _PustakaArtikelListItemState();
}

class _PustakaArtikelListItemState extends State<PustakaArtikelListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child:
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.saturation),
              child: Image.asset('assets/images/bannerartikel.png', fit: BoxFit.contain,),
            ),
          )
        ],
      ),
    );
  }
}
