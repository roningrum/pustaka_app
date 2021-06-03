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
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            margin: EdgeInsets.only(right: 16, left: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          ),
    )
    );
  }
}


