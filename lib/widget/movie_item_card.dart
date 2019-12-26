import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/model/content.dart';
import 'package:tourism_app/model/movie.dart';
import 'package:tourism_app/model/movie.dart';
import 'package:tourism_app/widget/floating_card.dart';
import 'package:tourism_app/widget/star_rating.dart';

import '../HomePage.dart';
import 'floating_card.dart';

class MovieItemCard extends StatelessWidget {
  const MovieItemCard(
      {Key key,
      @required this.cardSize,
      @required this.movie,
      @required this.index,this.contentDetails, this.content})
      : super(key: key);

  final double cardSize;
  final int index;
  final content;
  final Movie movie;
  final Content contentDetails;



  @override
  Widget build(BuildContext context ) {
    print("contentDetails");
    print(contentDetails);
    print(contentDetails.contentImage);
      return FloatingCard(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: movie.title,
              child: Image.network(
                contentDetails.contentImage,

                fit: BoxFit.cover,
              ),
            ),
          ),



          Positioned(
              left: 24,
              bottom: 24,
              child:
              Icon(Icons.person)
              ),
        ],
      ),
    );
  }
}
