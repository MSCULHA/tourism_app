import 'package:flutter/material.dart';
import 'package:tourism_app/data.dart';

class SuggestionItemMainPages extends StatefulWidget {

  SuggestionItemMainPages(int index, {this.onPress});
  final Function onPress;

  @override
  _SuggestionItemMainPageState createState() => _SuggestionItemMainPageState();
}

class _SuggestionItemMainPageState extends State<SuggestionItemMainPages> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/todo");
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.red,

                borderRadius: new BorderRadius.all(Radius.circular(25)),

              ),
              child: Center(
                child: Text(''),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            )
          ],
        ),
      ),
    );
  }
}