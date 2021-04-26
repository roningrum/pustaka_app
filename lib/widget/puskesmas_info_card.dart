import 'package:flutter/material.dart';
import 'package:pustaka_app/data/puskesmas.dart';

import '../const.dart';

class PuskesmasInfoCard extends StatelessWidget {
  const PuskesmasInfoCard({
    Key key,
    @required this.puskesmas,
    this.iconData,
    this.asset
  }) : super(key: key);

  final String puskesmas;
  final IconData iconData;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(16),
      height: 56.0,
      width: 312.0,
      child: RichText(
          text: TextSpan(children: [
        WidgetSpan(
          child: Container(
            child: Icon(
              iconData,
              color: kPrimaryColor,
              size: 24.0,
            ),
          ),
        ),
        WidgetSpan(
            child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  puskesmas,
                  style: kPustakaBlackRegular.copyWith(
                      fontSize: 13, color: kFontColor.withOpacity(0.5)),
                ))),
      ])),
    ));
  }
}
