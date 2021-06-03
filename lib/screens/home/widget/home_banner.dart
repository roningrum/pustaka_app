import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class HomeBanner extends StatefulWidget {

  const HomeBanner({Key key}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:5),() => setState((){
      isLoading = false;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16, left: 16),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: isLoading
            ? Shimmer.fromColors(
                child: SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(right: 16, left: 16),
                    height: 150,
                    color: Colors.grey,
                  ),
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100])
            : Image.asset(
                'assets/images/Banner.png',
              ));
  }
}
