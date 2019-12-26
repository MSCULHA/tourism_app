import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/addplayer.dart' ;
import 'package:tourism_app/data.dart';
import 'package:tourism_app/data.dart';
import 'package:tourism_app/data.dart';
import 'package:tourism_app/data.dart' as prefix0;
import 'package:tourism_app/model/content.dart';
import 'package:tourism_app/paidcard.dart';

import 'addplayer.dart';

class PaidCardss extends StatefulWidget {
  @override
  _PaidCardssState createState() => _PaidCardssState();
}

class _PaidCardssState extends State<PaidCardss> {
  int degisken = randomuser.length;

  void dgff() {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: 25,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => PaidCard()),
                        );
                      },
                      child: Icon(
                        Icons.close,
                        size: 50,
                        color: Colors.black,
                      )),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text( lastRead,
                                style: TextStyle(
                                    fontSize: 27,
                                    fontFamily: 'Lilita',
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 30, right: 30),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6.0,
                      spreadRadius: 7.0,
                      color: Colors.black12),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: 400,
              width: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 25,
                    ),
                    child: Row(children: []),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 25,
                    ),
                    child: Column(
                      children: <Widget>[


                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/bbsss.jpg',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Row(
                                  children: <Widget>[
                                    Text( (outRandom==plText

                                    //EĞER
                                        ?

                                    prefix0.userinput2 + ' asking ' + userinput1

                                    //DEĞİLSE
                                        :


                                    outRandom +' asking '+ plText) ,
                                        style: TextStyle(fontSize: 24,
                                            fontFamily: 'Lilita',
                                            fontWeight: FontWeight.w100, color: Colors.blueGrey[900])),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) =>

                                Container(
                                  child: SizedBox(
                                    child: SingleChildScrollView(
                                      child: content[currentindex],
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 2, right: 2),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        debugPrint(prefix0.outRandom);
                        debugPrint(prefix0.plText);

                        if (plText == outRandom) {
                          debugPrint('EŞİT OLDU');
                        } else if (outRandom == plText) {
                          debugPrint('EŞİT OLDU');
                        }


                        if ( userinput1 == plText) {
                          userinput1scor += 10;
                        }
                        if ( userinput2 == plText) {
                          userinput2scor += 10;
                        }
                        if ( userinput3 == plText) {
                          userinput3scor += 10;
                        }
                        if ( userinput4 == plText) {
                          userinput4scor += 10;
                        }


                        nextSubmit();
                        randomUser();
                        outRandomUser();
                      },
                      child: new Row(children: [
                        new Image.asset(
                          'assets/trues.gif',
                          width: 90.0,
                          height: 90.0,
                          fit: BoxFit.fill,
                        ),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {

                        debugPrint(prefix0.outRandom);
                        debugPrint(prefix0.plText);

                        if (plText == outRandom) {
                          debugPrint('EŞİT OLDU');
                        } else if (outRandom == plText) {
                          debugPrint('EŞİT OLDU');
                        }


                        if ( userinput1 == plText) {
                          userinput1scor -= 10;
                        }
                        if ( userinput2 == plText) {
                          userinput2scor -= 10;
                        }
                        if ( userinput3 == plText) {
                          userinput3scor -= 10;
                        }
                        if ( userinput4 == plText) {
                          userinput4scor -= 10;
                        }


                        randomUsers();
                        nextSubmit();
                        randomUser();
                        outRandomUser();
                      },
                      child: new Row(children: [
                        new Image.asset(
                          'assets/falses.gif',
                          width: 90.0,
                          height: 90.0,
                          fit: BoxFit.fill,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int currentindex = new Random().nextInt( content.length);

  void nextSubmit() {
    if (content[currentindex] == null) {
      SnackBar(
        content: Text("You must select an answer to continue."),
      );
      return;
    }
    if (currentindex < (content.length - 1)) {
      setState(() {
        currentindex = new Random().nextInt( content.length);
      });
    } else {
      setState(() {
        currentindex = new Random().nextInt( content.length);
      });
    }
  }


  void randomUsers() {
//SORAN KİŞİ
    setState(() {


      if((prefix0.plText == prefix0.randomuser)) {
        prefix0.text =
        randomuser[new Random().nextInt(
            randomuser.length)] == outRandom ? prefix0.text =
        randomuser[new Random().nextInt(
            randomuser.length)] : prefix0.text.toString();
      }

    });
  }

  void randomUser() {
//SORAN KİŞİ


    setState(() {
      plText =
      randomuser[new Random().nextInt(
          randomuser.length) -1];
    });



  }



  void outRandomUser() {
//SORAN KİŞİ

    setState(() {

      outRandom =
      randomuser[new Random().nextInt(
          randomuser.length)-1];

    });



  }
}


onTap ()  {


  return PaidCard();
}
