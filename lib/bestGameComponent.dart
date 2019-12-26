import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:tourism_app/CardSystem.dart';

import 'package:tourism_app/InAppPurchasePage.dart';
import 'HomePage.dart';
import 'data.dart';
//import 'quizBrain.dart';

//import 'question.dart';
import 'package:tourism_app/blocs/content_list_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:tourism_app/model/content.dart';

import 'mainscreen.dart';

bool iconControl=false;
var mert;



class LibraryWidget extends StatefulWidget {

  final Content contentDetails;

  LibraryWidget({this.contentDetails});

  @override
  _LibraryWidgetState createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  ContentListBloc contentListBloc;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(




      onTap: () {

        content = [];
        itemler = [];


        for (var i = 0; i < userDocument["contentText"].length; i++) {

          content.add(
            Text(userDocument["contentText"][i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF37464D),
                  fontSize: 22.0,
                  fontFamily: 'GalanoMedium',
                  fontWeight: FontWeight.w300,
                )),
          );
          itemler.add(i);

        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );

/*
          questionBank = [];
          for (var i = 0; i <
              widget.contentDetails.contentQuestions.length; i++) {
            questionBank.add(Question(widget.contentDetails.contentQuestions[i],
                widget.contentDetails.contentAnswers[i]),
            );
          }
*/
          content = content.reversed.toList();
          //   questionBank = questionBank.reversed.toList();

/*
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardSystem(),
              ));
*/
          //TODO : Buraya Navigator gelicek.



      },

      child: Padding(


        padding: const EdgeInsets.symmetric(horizontal:0.0,vertical: 18.0),
        child: Card(

          elevation:1,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFF3F4F8)),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:5.0),
              child: Column(
                children: <Widget>[
              StreamBuilder(
              stream: Firestore.instance
                  .collection('contents')
                  .document('OJYyvdctwPuYDLXWDx1e')
                  .snapshots(),
              builder: (context, snapshot) {
                userDocument = snapshot.data;
                if (userDocument != null  ) {
                  return Text(
                      ''//userDocument["contentText"].toString(),
                  );
                }
                else {
                  return Text("Loading...");
                }
              },
            ),
                  Container(
                  width: 250,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex:1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:0.0),
                              child: Container(
                                width: 250,
                                height: 160,

                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                        widget.contentDetails.contentImage),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );



  }
}


class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = 255,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35.0,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color:Color(0xFF2c3e50),width: 2.0),
          gradient: gradient, boxShadow: [

      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}