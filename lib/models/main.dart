/*
 * MIT Licence
 * Copyright 2017 @CodesBay (www.CodesBay.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files(the "Software"), to deal in the
 * Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and / or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so, subject to the following conditions :
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
 * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/data.dart' as prefix0;
import 'package:tourism_app/model/query.dart';
import 'package:tourism_app/paid_card.dart';
import 'package:tourism_app/screens/home/home.dart';
import 'package:tourism_app/screens/home/widgets/category_list.dart';
import 'package:tourism_app/screens/pokedex/pokedex.dart';
import 'package:tourism_app/todo/main.dart';
import 'package:tourism_app/widgets/poke_category_card.dart';

import '../HomePage.dart';
import '../SplashScreen.dart';
import '../data.dart';
import '../testData.dart';

void main()  {
  runApp(new MyAppsa());
}

class MyAppsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "Yapılacaklar Listesi", home: new HomePages(),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData( primarySwatch: Colors.green, ));



  }
}

class HomePages extends StatefulWidget {
  //@override
  @override
  State<StatefulWidget> createState() {
    return new HomePageWithState();
  }
}

class HomePageWithState extends State<HomePages> {
  final TextEditingController eCtrl = new TextEditingController();
  // CheckBox Widgets
  List<String> timeOfToDo = <String>[];
  List<Widget> theCheckBox = <Widget>[];
  List<bool> theCheckboxState = <bool>[false] ;
  bool showAlertDialog = false;
  bool showSelectedToDo = false;
  int selectedToDoIndex = 0;






  Future getPosts() async {

    var diziSorgula = await Firestore.instance
        .collection("post")
        .where("mainName", isEqualTo: oneData)
        .where("travelName", isEqualTo: prefix0.twoData )
        .getDocuments();


    return diziSorgula.documents;


  }

  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Column(children: <Widget>[


          Container(height: 70,),
          new Flexible(
              child: new GridView.builder(

                itemCount: theToDoLista.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5,mainAxisSpacing: 40),

                itemBuilder: (BuildContext context , int index){



                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                      onTap: (){

                        debugPrint('Basılan İndex ' +  theToDoLista[index]);


                        twoData = theToDoLista[index];


                        if(theToDoLista[index] == "Sightseeing"){


                          for (var i = 0; i < sight.length; i++) {
                            theToDoList.add(
                              sight[i],
                            );
                            itemler.add(i);
                          }

                          debugPrint(' SİGHTSEEİNG TRUE DÖNDÜ');


                        }



                        if(theToDoLista[index] == "Local Dished"){
                          for (var i = 0; i < localDished.length; i++) {
                            theToDoList.add(
                              prefix0.localDished[i],
                            );
                            itemler.add(i);
                          }

                          debugPrint(' LOCAL DİSHED TRUE DÖNDÜ');
                          debugPrint(prefix0.localDished.length.toString());
                        }
                        if(theToDoLista[index] == "Cultural Activities"){

                          for (var i = 0; i < prefix0.culture.length; i++) {
                            theToDoList.add(
                              prefix0.culture[i],
                            );
                            itemler.add(i);
                          }

                        }

                        if(theToDoLista[index] == "Social Areas"){

                          for (var i = 0; i < prefix0.cultures.length; i++) {
                            theToDoList.add(
                              prefix0.cultures[i],
                            );
                            itemler.add(i);
                          }


                        }

                        culture = [];
                        sight = [];
                        localDished = [];
                        cultures = [];

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyApps(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,

                            image: new DecorationImage(image: AssetImage(theImageLista[index]),
                              fit: BoxFit.fill,),
                          borderRadius: BorderRadius.all(Radius.circular(30))

                        ),
                        alignment: Alignment.center,
                        child: Text(
                            theToDoLista[index] + '' , style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900), textAlign: TextAlign.center,
                        ),

                      ),
                    ),
                  );


                },

          )),

          /*Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: Container(
                  height: 100,
                  width: 250,
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.yellow,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.grey,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pokedex()),
                      );
                    },
                  ),
                ),
              )
*/
        ]));
  }

  Widget _createCheckBox(int index) {
    if (theCheckBox.length < theToDoLista.length) {
      theCheckboxState.add(false);
      theCheckBox.add(new Checkbox(
          value: theCheckboxState[index],
          onChanged: (bool value) {
            setState(() {
              print("Current INDEX Is => $index");
              theCheckboxState[index] = value;
            });
          }));
    } else {
      theCheckBox[index] = new Checkbox(
          value: theCheckboxState[index],
          onChanged: (bool value) {
            setState(() {
              print("Current INDEX Is => $index");
              theCheckboxState[index] = value;
            });
          });
    }
    return theCheckBox[index];
  }

  Widget _createAppBar() {
    return new AppBar(
        title: new Text("Area you want to visit"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[]);
  }
}
