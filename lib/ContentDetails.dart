import 'package:flutter/material.dart';
import 'data.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class CardSystem extends StatefulWidget {
  final List contents;


  CardSystem({this.contents}) {
    print('[ContentListArea Widget] Constructor');
  }

  @override
  _CardSystemState createState() => new _CardSystemState();
}

class _CardSystemState extends State<CardSystem> {
  final FirebaseAnalytics analytics = FirebaseAnalytics();



  int pagemControl = 0;



  List _contents = [];
  @override
  void initState() {
    analytics.setCurrentScreen(screenName: 'CardSystem');
    print('[Contents State] initState()');
    if (widget.contents != null) {
      _contents.add(widget.contents);
      print(_contents);
      print(_contents.length);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {}
  swipeEvent(index, position) {
    print(index);
    print(position);
    itemler.removeAt(index);
    print("setState girdi");
    var x = content.length - index;
    var y = content.length - 1;
    var z = (x / y);
    var k = (z*100)-2;
    pagemControl = (k).toInt();
    setState(() {
      print(itemler);
      pagemControl = pagemControl *1;
      print(pagemControl);
    });
  }

}