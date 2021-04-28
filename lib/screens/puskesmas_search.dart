import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
                height: 55,
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Type Text Here...',
                      contentPadding: EdgeInsets.all(10.0),
                      hintStyle: kPustakaBlackBoldMedium.copyWith(fontSize: 15, color: Color(0xFF4D4D4D)),
                      filled: true,
                      fillColor: Color(0xFFE9E8E8),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.transparent, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.transparent, width: 1),
                      ),
                    ),
                  onChanged: onSearchTextChanged
                  ,
                )
            )
        )
    );
  }

  onSearchTextChanged(String text) async{
    if(text.isEmpty){
      setState(() {
        Toast.show('Ini kosong', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      //   Fluttertoast.showToast(
      //       msg: 'This is toast notification',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIos: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.yellow
      //   );
        return;
      });
    } else{
      Toast.show('$text', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
}
