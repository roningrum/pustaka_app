import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/const.dart';

class HomeArtikelList extends StatelessWidget {
  final photoArticle;
  final titleArticle;

  const HomeArtikelList({Key key, @required this.photoArticle, @required this.titleArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: 200,
        height: 145,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              child: _displayImage(photoArticle)
            ),
         Positioned(
           top: 69,
           left:80,
           bottom: 6,
           child: Container(
                  width: 115,
                  height: 55,
                  color: kPrimaryColor,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      titleArticle,
                      style: kPustakaWhiteNormal.copyWith(
                        fontSize: 12
                      ),
                      maxLines: 2,
                    ),
                  )
                ),
         ),
          ],
        ),
      ),
    );
  }
  Widget _displayImage(String photoUrl){
    if(photoUrl == null){
      return Container(
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8)
        ),
      );
    }
    else{
      return CachedNetworkImage(
        imageUrl: photoArticle,
        placeholder: (context, url) =>
            Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8)
          ),
        ),
        imageBuilder: (context, imageProvider) =>
            Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover, colorFilter:ColorFilter.mode(Colors.grey, BlendMode.saturation)),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
      );
    }
  }
}
