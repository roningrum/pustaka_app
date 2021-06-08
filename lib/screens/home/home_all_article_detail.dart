
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/const.dart';
import 'package:pustaka_app/data/network/news_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeArticleDetail extends StatefulWidget {
  final Articles articles;

  const HomeArticleDetail({Key key, this.articles}) : super(key: key);

  @override
  _HomeArticleDetailState createState() => _HomeArticleDetailState();
}

class _HomeArticleDetailState extends State<HomeArticleDetail> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  num pos = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: kFontColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: kSurfaceColor,
        title: Text(widget.articles.source.name, maxLines: 1, style: kPustakaBlackBoldMedium.copyWith(fontSize: 19),),
      ),
      body: IndexedStack(
        index: pos,
        children:[
          WebView(
            initialUrl: widget.articles.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageStarted: (value){
              setState(() {
                pos = 1;
              });
            },
            onPageFinished: (value){
              setState(() {
                pos = 0;
              });
            },
          ),
          Center(
            child: CircularProgressIndicator(color:kPrimaryColor,),
          )
        ]
      ),
    );
  }
}
