import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/addplayer.dart';
import 'package:tourism_app/blocs/bloc_provider.dart';
import 'package:tourism_app/data.dart' as prefix0;
import 'package:tourism_app/model/content.dart';
import 'package:tourism_app/paidcard.dart';

import 'bestGameComponent.dart';
import 'blocs/app_bloc.dart';
import 'blocs/content_list_bloc.dart';
import 'data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Color(0xFFee3f46),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.lightBlueAccent,
                  height: 350,
                      margin: EdgeInsets.only(
                        right: 15,
                        top: 50,
                        left: 15,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Center(
                          child:Text('Adam asdfa ${prefix0.lastRead}'),
                        ),
                      ),
                    ),

              ]),




        ),
      ),
    );
  }
}

class CategoryContentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics();
    return BlocProvider(
      bloc: ContentListBloc(BlocProvider.of<AppBloc>(context).firebaseService),
      child: Scaffold(
          backgroundColor: Color(0xFFFAFBFF),
          appBar: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            leading: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF052E44),
                  size: 20.0,
                ),
                onPressed: () {
                  debugPrint("Navigatore tıklandı");
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                transform: Matrix4.translationValues(-25, 4, 0),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Column(
                children: <Widget>[
                  ContentListArea(),
                ],
              ),
            ),
          )),
    );
  }
}

Widget _buildDealsLists(BuildContext context, List<DocumentSnapshot> snapshots) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: snapshots.length,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return LibraryWidget(
            contentDetails: Content.fromSnapshot(snapshots[index]));
      });
}

class ContentListArea extends StatefulWidget {
  @override
  ContentListAreaState createState() {
    return new ContentListAreaState();
  }
}

class ContentListAreaState extends State<ContentListArea> {
  ContentListBloc contentListBloc;

  @override
  void initState() {
    super.initState();
    contentListBloc = BlocProvider.of<ContentListBloc>(context);
  }

  @override
  void dispose() {
    contentListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder(
            stream: Firestore.instance
                .collection('contents')
                .where("contentImage")
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Center(child: CircularProgressIndicator())
                  : _buildDealsLists(context, snapshot.data.documents);
            },
          ),
        ],
      ),
    );
  }
}
