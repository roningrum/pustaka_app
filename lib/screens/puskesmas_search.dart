import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../const.dart';

class PuskesmasSearch extends StatefulWidget {
  static String id = "puskesmas_search";

  @override
  _PuskesmasSearchState createState() => _PuskesmasSearchState();
}

class _PuskesmasSearchState extends State<PuskesmasSearch> {
  TextEditingController searchController = TextEditingController();

  filterPuskesmas() {
    print('current text ${searchController.text}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      filterPuskesmas();
    });
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
                        fontSize: 15, color: Color(0xFF4D4D4D).withOpacity(0.5)),
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
                    print("$txt");
                  },
                ))));
  }
}
