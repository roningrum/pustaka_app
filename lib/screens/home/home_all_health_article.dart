import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/data/network/news_response.dart';
import 'package:pustaka_app/helper/news_api_service.dart';
import 'package:pustaka_app/screens/home/home_screen.dart';
import 'package:pustaka_app/screens/home/widget/home_all_article_item.dart';
import 'package:pustaka_app/widget/loading_puskesmas_widget.dart';

import '../../const.dart';

class HomeAllHealthArticle extends StatefulWidget {
  static String id = "home_all_health";
  const HomeAllHealthArticle({Key key}) : super(key: key);

  @override
  _HomeAllHealthArticleState createState() => _HomeAllHealthArticleState();
}

class _HomeAllHealthArticleState extends State<HomeAllHealthArticle> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSurfaceColor,
        elevation: 0,
        title: Text('Artikel Kesehatan Hari ini',
            style: kPustakaBlackRegular.copyWith(fontSize: 19)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: kFontColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(HomeScreen.id);
          },
        ),
      ),
      body: isLoading
          ? LoadingPuskesmas()
          : CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: FutureBuilder(
                  future: newsApiService.getArticles(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Articles>> snapshot) {
                    if (snapshot.hasData) {
                      List<Articles> articles = snapshot.data;
                      return Column(
                        children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: articles.length,
                                itemBuilder: (context, index) =>
                                    HomeAllArticleItem(
                                      photo: articles[index].urlToImage,
                                      title: articles[index].title,
                                      source: articles[index].source.name,
                                      hours: articles[index].publishedAt,
                                    )),
                        ],
                      );
                    } else {
                      return Column(
                          children:[
                            LoadingPuskesmas()
                          ] );
                    }
                  }),
            ),
          )
        ],
      )
    );
  }
}
