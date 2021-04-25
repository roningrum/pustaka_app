import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/screens/puskesmas_detail_page.dart';

class PuskesmasItemList extends StatelessWidget {
  final String foto, nama, alamat;

  PuskesmasItemList({this.foto, this.nama, this.alamat});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 0,
          child: Container(
            height: 100,
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 97,
                  height: 84,
                  child: CachedNetworkImage(
                    imageUrl: foto,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8)),
                    ),
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
                      Container(
                        margin: EdgeInsets.only(right: 12, top: 10),
                        child: Text(
                          alamat,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kPustakaBlackRegular.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 24, top: 15),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                  child: SvgPicture.asset(
                                      'assets/menu/place.svg')),
                              TextSpan(
                                  text: "1.2km",
                                  style: kPustakaGreenMedium.copyWith(
                                      fontSize: 13))
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
