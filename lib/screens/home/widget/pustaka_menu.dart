import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/widget/pustaka_icon_menu.dart';

// widget menu
class PustakaMenu extends StatefulWidget {
  final String asset;
  final String title;
  final String routePage;

  const PustakaMenu({Key key, @required this.asset, @required this.title, this.routePage}) : super(key: key);

  @override
  _PustakaMenuState createState() => _PustakaMenuState();
}

class _PustakaMenuState extends State<PustakaMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: PustakaIconMenu(
        images: widget.asset,
        title: widget.title,
      ),
      onTap: (){
        routeToPage(widget.routePage);
      },
    );
  }

  void routeToPage(String routePage) {
    Navigator.of(context).pushNamed(routePage);
  }
}
