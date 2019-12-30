library circular_check_box;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/data.dart' as prefix0;
import 'package:tourism_app/model/query.dart';
import 'package:tourism_app/screens/home/home.dart';
import 'package:tourism_app/screens/pokedex/pokedex.dart';
import 'package:tourism_app/screens/pokemon_info/pokemon_info.dart';
import 'package:tourism_app/widgets/poke_category_card.dart';

import '../HomePage.dart';
import '../SplashScreen.dart';
import '../data.dart';
import '../test.dart';
import '../testData.dart';
List<bool> theCheckboxState = <bool>[false] ;
List<bool> Sighseeing = <bool>[false];
List<bool> LocalDished = <bool>[false];
List<bool> Cultural = <bool>[false];
List<bool> Social = <bool>[false] ;



List<bool> deneme = <bool>[false] ;

void main() {
  runApp(new MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp( home: new HomePage());
  }
}

class HomePage extends StatefulWidget {
  //@override
  @override
  State<StatefulWidget> createState() {
    return new HomePageWithState();
  }
}

class HomePageWithState extends State<HomePage> {
  final TextEditingController eCtrl = new TextEditingController();
  // CheckBox Widgets
  List<String> timeOfToDo = <String>[];
  List<Widget> theCheckBox = <Widget>[];
  bool showAlertDialog = false;
  bool showSelectedToDo = false;
  int selectedToDoIndex = 0;





  @override
  void initState() {
    super.initState();
    //  TipServices().getTodoContent(oneData,twoData);



    // TipServices().getContentCategory(oneData,twoData);


  }

  Future getPosts() async {

    QuerySnapshot qn = TipServices().getCategories(oneData, twoData);
    return qn.documents;

  }


  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: _createAppBar(),
        body: new Column(children: <Widget>[
          new FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot){

              if(snapshot.connectionState == ConnectionState.waiting){

                return Center(
                  child: Text(''),
                );
              }
              else{

                return new ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: new EdgeInsets.all(12.0),
                  reverse: false,
                  itemBuilder: (_, int index) {
                    return new Column(children: <Widget>[
                      GestureDetector(
                        onTap: () {


                          debugPrint('TIKLANDI');

                          treeData = theToDoList[index];


                          debugPrint(treeData);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonInfo(),
                              ));
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                              color:
                              theCheckboxState[index] == true  ? Colors.red : Colors.blueAccent, //new Color.fromRGBO(255, 0, 0, 0.0),
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                  bottomRight: const Radius.circular(40.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Row(children: <Widget>[
                                  _createCheckBox(index),
                                  theCheckboxState[index] == true
                                      ? new Text(
                                    theToDoList[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  )  : Text(
                                    theToDoList[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new Row(children: <Widget>[]),
                      new Divider(

                        height: 14.0,
                        color: Colors.lightBlue,
                      )
                    ]);
                  },
                  itemCount: theToDoList.length,
                );
              }

            },
          ),

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
    if (theCheckBox.length < theToDoList.length) {
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
              theCheckboxState[index] = value;///  the checkboxstate i değiştirme. burada farklı listeler koy eğer sighseeing is sightseeing listesini setle.

             
            });
          });
    }
    return theCheckBox[index];
  }

  Widget _createAppBar() {
    return new AppBar(
        title: new Text("To Do List"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[]);
  }
}
