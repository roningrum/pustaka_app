import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPuskesmas extends StatefulWidget {
  @override
  _LoadingPuskesmasState createState() => _LoadingPuskesmasState();
}

class _LoadingPuskesmasState extends State<LoadingPuskesmas> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: ListView.builder(
            itemBuilder: (_, __) => Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 97,
                    height: 84,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            width: double.infinity,
                            height: 11,
                            child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white))),
                        Container(
                          margin: EdgeInsets.only(right: 12, top: 10),
                          child: SizedBox(
                              width: double.infinity,
                              height: 11,
                              child: DecoratedBox(
                                  decoration:
                                  BoxDecoration(color: Colors.white))),
                        ),
                        Container(
                            width: 20,
                            height: 11,
                            margin: EdgeInsets.only(right: 24, top: 15),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 11,
                                  child: DecoratedBox(
                                      decoration:
                                      BoxDecoration(color: Colors.white)),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ),
            itemCount: 5,
          ),
        ));
  }
}