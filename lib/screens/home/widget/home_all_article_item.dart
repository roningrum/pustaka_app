import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../const.dart';

class HomeAllArticleItem extends StatelessWidget {
  final String photo, title, hours, source;

  const HomeAllArticleItem(
      {Key key,
      @required this.photo,
      @required this.title,
      @required this.hours,
      @required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation : 0,
      child: Container(
        height: 100,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 97,
              height: 84,
              child: CachedNetworkImage(
                imageUrl: photo,
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
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kPustakaBlackBoldMedium.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children:[
                      Container(
                        margin: EdgeInsets.only(left: 12, top: 10),
                        child: Text(
                          getTimeSinceDate(hours),
                          style: kPustakaBlackRegular.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 12, top: 10),
                        child: Text(
                          source,
                          style: kPustakaBlackRegular.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  String getTimeSinceDate(String dateString, {bool numericDates = true}){
    DateTime date =  DateFormat("yyyy-MM-ddTHH:mm:ss").parse(dateString);
    final nowDate = DateTime.now();
    final difference = nowDate.difference(date);

    if (difference.inDays > 8) {
      return dateString;
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 minggu lalu' : 'minggu lalu';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} hari lalu';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 hari lalu' : 'kemarin';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} jam lalu';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 jam lalu' : 'sejam lalu';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} menit lalu';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 menit lalu' : 'semenit lalu';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} detik lalu';
    } else {
      return 'Sekarang';
    }
  }
}
