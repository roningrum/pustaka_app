import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/screens/puskesmas_menu_screen.dart';

class PuskesmasDetail extends StatelessWidget {
  final Puskesmas puskesmas;

  const PuskesmasDetail({Key key, this.puskesmas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 4,
        title: Text('Informasi Puskesmas',
            style: kPustakaWhiteMedium.copyWith(fontSize: 19)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: kSurfaceColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(PuskesmasMenuScreen.id);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 40),
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 189,
                          height: 120,
                          margin: EdgeInsets.only(top: 13.0),
                          child: CachedNetworkImage(
                            imageUrl: puskesmas.foto,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            puskesmas.nama,
                            style: kPustakaBlackBoldMedium.copyWith(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            puskesmas.alamat,
                            style: kPustakaBlackBoldMedium.copyWith(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
            Container(
              color: kSurfaceColor,
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                              icon
                            ),
                            TextSpan(
                                text: "1.2km",
                                style: kPustakaGreenMedium.copyWith(
                                    fontSize: 13))
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
