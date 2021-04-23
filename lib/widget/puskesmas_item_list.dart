import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/const.dart';

class PuskesmasItemList extends StatelessWidget {
  final String foto, nama, alamat;

  PuskesmasItemList({this.foto, this.nama, this.alamat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 97,
                  height: 84,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(foto), fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            nama,
                            style: kPustakaBlackBoldMedium.copyWith(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 20),
                          Text(
                            alamat,
                            style: kPustakaBlackRegular.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 17),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.location_on,
                                      color: kPrimaryColor,
                                    )),
                                TextSpan(
                                    text: "1.2km",
                                    style: kPustakaGreenMedium.copyWith(fontSize: 13))
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ));
  }
}
