import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/data/network/news_response.dart';
import 'package:pustaka_app/helper/news_api_service.dart';

class HomeArtikel extends StatefulWidget {
  const HomeArtikel({Key key}) : super(key: key);

  @override
  _HomeArtikelState createState() => _HomeArtikelState();
}

class _HomeArtikelState extends State<HomeArtikel> {
  NewsApiService newsApiService = NewsApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: newsApiService.getArticles(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Articles>> snapshot) {
            if (snapshot.hasData) {
              List<Articles> articles = snapshot.data;
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) => ListTile(
                        title: Text(articles[index].title),
                        )),
              );
            }
            return _loadingArticle();
          }),
    );
  }

  Widget _loadingArticle() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
