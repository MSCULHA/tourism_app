import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourism_app/data.dart';
import 'package:tourism_app/paid_card.dart';

import 'cards_hub.dart';


/* List<String> UserList =  [
  userinput1,userinput2,userinput3,userinput4,userinput5

];*/

class PaidCards extends StatefulWidget {
  @override
  _PaidCardsState createState() => _PaidCardsState();
}

class _PaidCardsState extends State<PaidCards> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFFee3f46),
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 0.0)],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    height: 450,
                    width: 400,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Team',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 32,
                                  color: Colors.red,
                                  fontFamily: 'Lilita'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Form(
                        key: formKey,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }},
                          onSaved: (String user1) {
                            userinput1 = user1;
                            randomuser.add(userinput1);
                            userdata.add(userinput1);
                          },
                          cursorColor: Colors.pinkAccent,
                          decoration: InputDecoration(
                              labelStyle: new TextStyle(
                                color: Colors.blue[200],
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFee3f46), width: 5.0),
                              ),
                              hintText:
                              '   1.Player Name'),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Form(
                        key: formKey2,
                        child: TextFormField(
                                  validator: (String values) {
                                  if (values.isEmpty) {
                                  return 'Please enter some text';
                                  }},
                                    onSaved: (String user2) {
                            userinput2 = user2;
                            randomuser.add(userinput2);
                            userdata.add(userinput2);
                          },
                          cursorColor: Colors.pinkAccent,
                          decoration: InputDecoration(
                              labelStyle: new TextStyle(
                                color: Colors.blue[200],
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFee3f46), width: 5.0),
                              ),
                              hintText:
                              '   2.Player Name'),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Form(
                        key: formKey3,
                        child: TextFormField(
                          onSaved: (String user3) {
                            userinput3 = user3;
                            randomuser.add(userinput3);
                            userdata.add(userinput3);
                          },
                          cursorColor: Colors.pinkAccent,
                          decoration: InputDecoration(
                              labelStyle: new TextStyle(
                                color: Colors.blue[200],
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFee3f46), width: 5.0),
                              ),
                              hintText:
                              '   4.Player Name'),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      Form(
                        key: formKey4,
                        child: TextFormField(
                          onSaved: (String user4) {
                            userinput4 = user4;
                            randomuser.add(userinput4);
                            userdata.add(userinput4);
                          },
                          cursorColor: Colors.pinkAccent,
                          decoration: InputDecoration(
                              labelStyle: new TextStyle(
                                color: Colors.blue[200],
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFFee3f46), width: 5.0),
                              ),
                              hintText:
                              '   4.Player Name'),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xFFee3f46),
                        )),
                    textColor: Colors.red,
                    color: Colors.white,
                    onPressed: () {

                      if((formKey.currentState.validate() && formKey2.currentState.validate())) {

                          formKey.currentState.save();

                        if (formKey2.currentState.validate()) {
                          formKey2.currentState.save();
                        }


                          if (formKey3.currentState.validate()) {
                            formKey3.currentState.save();
                          }


                          if (formKey4.currentState.validate()) {
                          formKey4.currentState.save();
                        }

                          if(userinput3 == ""){

                            randomuser.remove(userinput3);

                          }

                        plText =

                        randomuser[new Random().nextInt(
                            randomuser.length - 1)];

                        outRandom =
                        randomuser[new Random().nextInt(
                            randomuser.length - 1)];


                        debugPrint(randomuser.toString());

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => PaidCardss()),
                        );




                      }
                    },


                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Center(
                        child: Text('Start Game',
                            style: TextStyle(
                                fontSize: 30, fontFamily: 'Lilita')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class Rank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(),
                  child: Center(
                      child: TextField(
                        cursorColor: Colors.pinkAccent,
                        decoration: InputDecoration(
                            labelStyle: new TextStyle(
                              color: Colors.blue[200],
                            ),
                            border: InputBorder.none,
                            hintText: '          Lütfen Kullanıcı Adınızı Giriniz'),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
