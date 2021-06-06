import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeArtikelList extends StatelessWidget {
  final photoArticle;
  final titleArticle;

  const HomeArtikelList({Key key, @required this.photoArticle, @required this.titleArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 120,
        child: Stack(
          children: <Widget>[
            Container(
              width: 185,
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                imageUrl: photoArticle,
                imageBuilder: (context, imageProvider) =>
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
            ),
            Container(
              width: 185,
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                imageUrl: photoArticle,
                imageBuilder: (context, imageProvider) =>
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
