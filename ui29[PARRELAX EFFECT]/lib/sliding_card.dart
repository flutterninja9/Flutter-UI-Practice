import 'package:flutter/material.dart';
import 'package:testui29/cardContent.dart';

class SlidingCard extends StatelessWidget {
  final String name; //<-- title of the event
  final String date; //<-- date of the event
  final String assetName; //<-- name of the image to be displayed
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    this.offset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), //<--custom shape
      child: Column(
        children: <Widget>[
          ClipRRect(  //<--clipping image
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            child: Image.network( //<-- main image
              assetName,
              alignment: Alignment(-offset.abs(),0),
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.none,
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: CardContent( //<--replace the Container with CardContent
              name: name,
              date: date,
            ),
          ),
        ],
      ),
    );
  }
}