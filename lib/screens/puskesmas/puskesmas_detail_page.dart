import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/puskesmas.dart';
import 'package:pustaka_app/widget/puskesmas_info_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
          elevation: 0,
          title: Text('Informasi Puskesmas',
              style: kPustakaWhiteNormal.copyWith(fontSize: 15)),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kSurfaceColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: kSurfaceColor,
              margin: EdgeInsets.only(top: 200),
            ),
            Positioned(
              top: 32,
              right: 24,
              left: 24,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 200.0,
                        width: 280.0,
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: puskesmas.foto,
                              width: 189,
                              height: 120,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(8)),
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
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: '1.2 km ',
                                style:
                                    kPustakaGreenMedium.copyWith(fontSize: 13),
                              ),
                              TextSpan(
                                text: 'dari posisi',
                                style: kPustakaBlackRegular.copyWith(
                                  fontSize: 13,
                                  color: kFontColor.withOpacity(0.5),
                                ),
                              )
                            ]))
                          ],
                        ),
                      ),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    PuskesmasInfoCard(
                      iconData: Icons.home_rounded,
                      puskesmas: puskesmas.alamat,
                    ),
                    PuskesmasInfoCard(
                      iconData: Icons.phone,
                      puskesmas: puskesmas.telepon_kantor,
                    ),
                    InkWell(
                      child: PuskesmasInfoCard(
                        iconData: Icons.phone_android_outlined,
                        puskesmas: puskesmas.telepon,
                      ),
                      onTap:() async{
                        var url = "$Whatsapp_URL/${puskesmas.telepon}";
                        await launch(url);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
 }


