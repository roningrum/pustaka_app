import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pustaka_app/widget/pustaka_icon_menu.dart';

import '../../../const.dart';

// widget menu
class PustakaMenu extends StatefulWidget {
  final String asset;
  final String title;
  final String routePage;

  const PustakaMenu(
      {Key key, @required this.asset, @required this.title, this.routePage})
      : super(key: key);

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
        onTap: () {
          setState(() {
            if (widget.routePage != "") {
              routeToPage(widget.routePage);
            } else {
              showModalBottomSheet(
                  enableDrag: false,
                  context: context,
                  builder: (context) => Container(
                        width: double.infinity,
                        height: 305,
                        alignment: Alignment.center,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/images/develop.svg',
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Fitur belum tersedia",
                                  style: kPustakaBlackBoldMedium.copyWith(
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Fitur sedang dalam tahap pengembangan.\nMohon bersabar ya lur",
                                  style: kPustakaBlackRegular.copyWith(
                                      fontSize: 12, color: Colors.black38),
                                ),
                              ),
                              Container(
                                  width: 200,
                                  height: 45,
                                  margin: EdgeInsets.only(top: 16),
                                  child: ElevatedButton(
                                    child: Text(
                                      "Siap",
                                      style: kPustakaWhiteNormal.copyWith(
                                          fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kPrimaryColor)),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ));
            }
          });
        });
  }

  void routeToPage(String routePage) {
    Navigator.of(context).pushNamed(routePage);
  }
}
