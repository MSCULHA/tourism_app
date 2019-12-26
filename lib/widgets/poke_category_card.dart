import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart';
import 'package:tourism_app/HomePage.dart';
import 'package:tourism_app/data.dart';
import 'package:tourism_app/data.dart' as prefix0;
import 'package:tourism_app/model/content.dart';
import 'package:tourism_app/screens/home/widgets/category_list.dart';

import '../models/category.dart';

String dattest;
class PokeCategoryCard extends StatelessWidget {

  const PokeCategoryCard(

     int categori,  {
    Key key,
    this.onPress,
  }) : super(key: key);


  final Function onPress;

  Widget _buildCardContent() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(

          theToDoLista[indexHolder],
          style: TextStyle(
            fontSize: 12,

            fontWeight: FontWeight.w600,
            height: 2,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {


        return Stack(
          children: <Widget>[

            Container(
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(0),
                color: Colors.blueAccent,

                onPressed:(){
                  twoData =  theToDoLista[0];

                  dattest =  theToDoLista[0];
                  onPress();



                  debugPrint(twoData);




                } ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      _buildCardContent(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
