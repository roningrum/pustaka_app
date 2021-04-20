import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pustaka_app/const.dart';

class PustakaIconMenu extends StatelessWidget {
  final String images;
  final double size;
  final String title;

  const PustakaIconMenu(
      {Key key, @required this.images, this.size = 36, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            images,
            height: size,
            width: size,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: kPustakaBlackRegular.copyWith(fontSize: 11),
            textAlign: TextAlign.center,
          )
        ],
    );
  }
}
