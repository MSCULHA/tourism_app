import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/HomePage.dart';
import 'package:tourism_app/data.dart';

import 'addplayer.dart';

String nulll = "";
class PaidCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor:Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 50),
            child: Column(
                children: <Widget>[
                 Row(
                   children: <Widget>[
                     Image.asset('assets/gameover.png', width: 380, height: 400,),
                   ],
                 ),

                   Row(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(top: 30),
                         child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(45.0),
                                )),
                            onPressed: () {

                              Navigator.of(context).pushNamedAndRemoveUntil('/screen4', (Route<dynamic> route) => false);

                              randomuser=[];

                            },
                            color:  Colors.red[900],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 30),
                            child: new Text(" proceed, y'all!",
                                style: TextStyle(fontSize: 26, fontFamily: 'Lilita',fontWeight: FontWeight.w200, color: Colors.white) ),
                          ),
                       ),
                     ],
                   ),
                ]),
          ),
    ),
    );
  }
}

class Rank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 5),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(child: Row(children: <Widget>[
                  Container(margin: EdgeInsets.only(right: 10),
                  height: 45,
                  width: 45,
                  decoration: new BoxDecoration(
                    color: Color(0xFFee3f46),
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text('1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                        fontFamily: 'Lilita',fontWeight: FontWeight.w400),)),
                ),

                  Text(userdata[0] ,style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Lilita',fontWeight: FontWeight.w400),
    ),
                ],
                ),

                ),

                Container(
                    child: Row(children: <Widget>[

                       Icon(Icons.star_border,color: Color(0xFFee3f46),size: 30,),

                      Container(width: 5),
                      Text(userinput1scor.toString(),style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),),
                      Container(width: 20),
                ])),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                width: 320,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Rank2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 5),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(child: Row(children: <Widget>[
                  Container(margin: EdgeInsets.only(right: 10),
                    height: 45,
                    width: 45,
                    decoration: new BoxDecoration(
                      color: Color(0xFFee3f46),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text('2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),)),
                  ),

                  Text(userdata[1]   ,style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Lilita',fontWeight: FontWeight.w400),
                  ),
                ],
                ),

                ),

                Container(
                    child: Row(children: <Widget>[

                      Icon(Icons.star_border,color: Color(0xFFee3f46),size: 30,),

                      Container(width: 5),
                      Text(userinput2scor.toString(),style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),),
                      Container(width: 20),
                    ])),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                width: 320,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Rank3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 5),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(child: Row(children: <Widget>[
                  Container(margin: EdgeInsets.only(right: 10),
                    height: 45,
                    width: 45,
                    decoration: new BoxDecoration(
                      color: Color(0xFFee3f46),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text('3',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),)),
                  ),

                  Text(userdata[2],style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lilita',fontWeight: FontWeight.w400),
                  ),
                ],
                ),

                ),

                Container(
                    child: Row(children: <Widget>[

                      Icon(Icons.star_border,color: Color(0xFFee3f46),size: 30,),

                      Container(width: 5),
                      Text(userinput3scor.toString(),style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),),
                      Container(width: 20),
                    ])),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                width: 320,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Rank4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(right: 20,left: 20,top: 5),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(child: Row(children: <Widget>[
                  Container(margin: EdgeInsets.only(right: 10),
                    height: 45,
                    width: 45,
                    decoration: new BoxDecoration(
                      color: Color(0xFFee3f46),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text('4',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),)),
                  ),

                  Text(userdata[3]    ,style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Lilita',fontWeight: FontWeight.w400),
                  ),
                ],
                ),

                ),

                Container(
                    child: Row(children: <Widget>[

                      Icon(Icons.star_border,color: Color(0xFFee3f46),size: 30,),

                      Container(width: 5),
                      Text(userinput4scor.toString(),style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lilita',fontWeight: FontWeight.w400),),
                      Container(width: 20),
                    ])),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                width: 320,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void hesap(){



}



