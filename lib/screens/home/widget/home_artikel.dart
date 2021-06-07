import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/network/news_response.dart';
import 'package:pustaka_app/helper/news_api_service.dart';
import 'package:pustaka_app/screens/home/widget/home_artikel_list.dart';
import 'package:shimmer/shimmer.dart';

class HomeArtikel extends StatefulWidget {
  const HomeArtikel({Key key}) : super(key: key);

  @override
  _HomeArtikelState createState() => _HomeArtikelState();
}

class _HomeArtikelState extends State<HomeArtikel> {
  NewsApiService newsApiService = NewsApiService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5),
        () => setState(() {
              isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _listArticleLoading()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 24.0),
                    child: Text(
                      "Artikel Kesehatan",
                      style: kPustakaBlackBoldMedium.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Text(
                      "Lihat Artikel",
                      style: kPustakaGreenRegular.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w100),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                  future: newsApiService.getArticles(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Articles>> snapshot) {
                    if (snapshot.hasData) {
                      List<Articles> articles = snapshot.data;
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        height: 135,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) => HomeArtikelList(
                                  photoArticle: articles[index].urlToImage,
                                  titleArticle: articles[index].title,
                                )),
                      );
                    } else {
                      return _loadingImageArticle();
                    }
                  }),
              SizedBox(height: 24)
            ],
          );
  }

  Widget _listArticleLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24.0),
                width: 100,
                color: Colors.grey[400],
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(right: 24.0),
                width: 100,
                color: Colors.grey[400],
                height: 16,
              ),
            ],
          ),
          _loadingImageArticle()
        ],
      ),
    );
  }

  Widget _loadingImageArticle(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      height: 135,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (_, __) => Row(children: [
          Container(
              width: 200,
              height: 135,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8))),
          Container(
              width: 200,
              height: 135,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8))),
        ]),
      ),
    );
  }
}
