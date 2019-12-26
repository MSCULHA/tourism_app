import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tourism_app/model/movie.dart';
import 'package:tourism_app/popular_movies_main_page.dart';
import 'package:tourism_app/screens/home/home.dart';
import 'package:tourism_app/widget/dart.dart';
import 'ContentDetails.dart';
import 'InAppPurchasePage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'data.dart';
import 'package:tourism_app/blocs/content_list_bloc.dart';
import 'package:tourism_app/model/content.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourism_app/blocs/app_bloc.dart';
import 'mainscreen.dart';
import 'model/query.dart';
import 'models/main.dart';

//import 'package:tourism_app/FavWidgetClass.dart';
bool test = false;
var contents;
int version;
String facebook;
String GezilecekYerler;
Timestamp date;

class Homes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Homes> {
  AppBloc appBloc;
  ContentListBloc contentListBloc;

  @override
  void initState() {
    super.initState();
    TipServices().getTipContent(oneData,twoData,treeData);


  }

  @override
  Future dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics();
    analytics.setAnalyticsCollectionEnabled(true);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 0.0),
              ),
              const SizedBox(height: 3),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 30.0, top: 5, bottom: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[],
                        ),
                      ),
                      CategorySlider(),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

class CategorySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          color: Colors.grey[900],
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, left: 8.0, bottom: 15.0),
              ),
              GestureDetector(
                onTap: () {
                  randomuser = [];

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAppsa(),
                      ));
                },
                child: Row(
                  children: <Widget>[],
                ),
              ),
              Container(
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 12.0),
                  child: Container(
                    height: 605,
                    child: StreamBuilder(
                      stream:
                          Firestore.instance.collection('contents').snapshots(),
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? Center(child: CircularProgressIndicator())
                            : _buildDealsList(context, snapshot.data.documents);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPageHeader extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final String bookName;
  final String desc;

  MainPageHeader({this.bookName, this.desc});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {


/*
        questionBank = [];
        for (var i = 0; i < userDocument["contentQuestions"].length; i++) {
          questionBank.add(
            Question(userDocument["contentQuestions"][i],
                userDocument["contentAnswers"][i]),
          );
        }
*/



        content = content.reversed.toList();
        //   questionBank = questionBank.reversed.toList();

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAppsa(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Card(
                    elevation: 2,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFFF3F4F8)),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      color: Colors.red,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: AssetImage('assets/mainpage.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(3.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  'Popular',
                                  style: TextStyle(
                                      fontFamily: 'GalanoMedium',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF2c3e50),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                        width: 315,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              bookName,
                                              style: TextStyle(
                                                  fontFamily: 'GalanoBold',
                                                  color: Colors.white,
                                                  fontSize: 18.0),
                                            ),
                                            Text(
                                              desc,
                                              style: TextStyle(
                                                  fontFamily: 'GalanoMedium',
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFF3F4F8)),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 15.0, bottom: 15.0),
                              child: Text('Recent Books',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "GalanoBold",
                                    color: Color(0xFF2B3D50),
                                  )),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Container(
                          height: 260,
                          child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('contents')
                                .snapshots(),
                            builder: (context, snapshot) {
                              return !snapshot.hasData
                                  ? Center(child: CircularProgressIndicator())
                                  : _buildDealsList(
                                      context, snapshot.data.documents);
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDealsList(BuildContext context, List<DocumentSnapshot> snapshots) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: snapshots.length,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return SuggestionItemMainPage(
            contentDetails: Content.fromSnapshot(snapshots[index]));
      });
}

class SuggestionItemMainPage extends StatefulWidget {
  SuggestionItemMainPage({this.contentDetails});
  final Content contentDetails;

  @override
  _SuggestionItemMainPageState createState() => _SuggestionItemMainPageState();
}

class _SuggestionItemMainPageState extends State<SuggestionItemMainPage> {
  final _documentData = BehaviorSubject<QuerySnapshot>();

  Observable<QuerySnapshot> get documentData => _documentData.stream;

  getAllDocuments() async {
    QuerySnapshot allDocuments = await getAllDocuments();
    //After retrieve all documents, we sink into the pipe (stream)
    _documentData.sink.add(allDocuments);
  }

  void dispose() async {
    await _documentData.drain();
    _documentData.close();
  }

  final FirebaseAnalytics analytics = FirebaseAnalytics();
  var paddingControl = 5.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        theToDoLista = [];
        content = [];
        itemler = [];
        localDished = [];
        theToDoList = [];
        lastRead = widget.contentDetails.contentName;
        contentDesc = widget.contentDetails.contentDescription;
        oneData = widget.contentDetails.contentName;
        // tipContents = widget.contentDetails.tipConent;

        debugPrint(lastRead);

        debugPrint(oneData);

        for (var i = 0; i < widget.contentDetails.tipContent.length; i++) {
          theToDoLista.add(
            widget.contentDetails.tipContent[i],
          );
          itemlerss.add(i);
        }


        for (var i = 0; i < widget.contentDetails.localDished.length; i++) {
          localDished.add(
            widget.contentDetails.localDished[i],
          );
          itemler.add(i);
        }

        for (var i = 0; i < widget.contentDetails.cultures.length; i++) {
          cultures.add(
            widget.contentDetails.cultures[i],
          );
          itemler.add(i);
        }

        for (var i = 0; i < widget.contentDetails.culture.length; i++) {
          culture.add(
            widget.contentDetails.culture[i],
          );
          itemler.add(i);
        }


        for (var i = 0; i < widget.contentDetails.sight.length; i++) {
          sight.add(
            widget.contentDetails.sight[i],
          );
          itemler.add(i);
        }






        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAppsa(),
            ));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              width: 380  ,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(
                  image: NetworkImage(widget.contentDetails.contentImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Center(
                child: Text(widget.contentDetails.contentName + ' ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}
