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
import 'package:tourism_app/screens/pokemon_info/pokemon_info.dart';
import 'package:tourism_app/todo/main.dart';
import 'package:tourism_app/widgets/poke_category_card.dart';
import 'package:async/async.dart';
import 'package:tourism_app/HomePage.dart';
import 'package:tourism_app/SplashScreen.dart';
import 'package:tourism_app/data.dart';
import 'package:tourism_app/testData.dart';

String mert;

void main() {
  runApp(new MyAppsa());
}

class MyAppsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Yapılacaklar LiSDFSFstesi",
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new HomePages());
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

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('$treeData'),
        ),
        body: ListPage());
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot sn = await firestore
        .collection("post")
        .where("mainName", isEqualTo: oneData)
        .where("travelName", isEqualTo: twoData)
        .where("contentTip", isEqualTo: treeData)
        .getDocuments();

    return sn.documents;
  }

  navigateToDetail(DocumentSnapshot post){

    Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonInfo(post: post,)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {


                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey  ,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                        height: 150,
                        width: 100,

                        child: Container(

                          child: ListTile(
                              title: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            snapshot.data[index].data["postName"]),
                                      )
                                    ],
                                  )),

                                  onTap: () => navigateToDetail(snapshot.data[index])
                          ),
                        )
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
