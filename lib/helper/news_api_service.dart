import 'dart:convert';

import 'package:pustaka_app/data/network/news_response.dart';
import 'package:http/http.dart' as http;

class NewsApiService{
  final API_KEY = '3666cd047c144309ada26d6b1a1011f9';
  Future<List<Articles>> getArticles() async{
    final articlesUrl = 'https://newsapi.org/v2/top-headlines?apiKey=$API_KEY&country=id&category=health&language=id';
    final response = await http.get(Uri.parse(articlesUrl));

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> data = jsonResponse['articles'];
      List<Articles> articleList = data.map((data) => Articles.fromJson(data)).toList();
      return articleList;
    }
  }
}