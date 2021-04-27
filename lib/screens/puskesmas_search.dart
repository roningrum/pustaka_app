import 'package:flutter/material.dart';

import '../const.dart';

class PuskesmasSearch extends StatefulWidget {
  static String id = "puskesmas_search";

  @override
  _PuskesmasSearchState createState() => _PuskesmasSearchState();
}

class _PuskesmasSearchState extends State<PuskesmasSearch> {
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
          height: 35,
          child: TextField(
            decoration: InputDecoration(
              hintStyle: kPustakaGreenRegular.copyWith(fontSize: 15),
              hintText: "Cari Puskesmas",
              border: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.all(Radius.circular(90.0)),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                  )
                //borderSide: const BorderSide(),
              ),
              filled: true,
              fillColor: Colors.white24,
            ),

          ),

        ),
      ),
    );
  }
}
