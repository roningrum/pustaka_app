import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHome extends StatefulWidget {
  const LoadingHome({Key key}) : super(key: key);

  @override
  _LoadingHomeState createState() => _LoadingHomeState();
}

class _LoadingHomeState extends State<LoadingHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey[100],
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
          ),
    )
    );
  }
}
