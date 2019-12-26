import 'package:flutter/material.dart';
import 'bestGameComponent.dart';
import 'blocs/app_bloc.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/content_list_bloc.dart';
import 'data.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'mainscreen.dart';
import 'model/content.dart';



class CategoryContentsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics();
    return BlocProvider(
      bloc: ContentListBloc(BlocProvider.of<AppBloc>(context).firebaseService),
      child: Scaffold(
          backgroundColor: Color(0xFFFAFBFF),
          appBar: AppBar(
            backgroundColor:Color(0xFFFAFAFA),
            leading: Padding(
              padding: const EdgeInsets.only(bottom:3.0),
              child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Color(0xFF052E44),size: 20.0,),  onPressed: (){

                debugPrint("Navigatore tıklandı");

              },
                  ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title:  Container(
                transform: Matrix4.translationValues(-25, 4,0),

              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:22.0),
              child: Column(
                children: <Widget>[
                  ContentListArea(),
                ],
              ),
            ),
          )

      ),
    );

  }
}



Widget _buildDealsList(BuildContext context, List<DocumentSnapshot> snapshots) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount:snapshots.length,
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
            stream: Firestore.instance.collection('contents').where("contentImage").snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Center(child: CircularProgressIndicator())
                  : _buildDealsList(context, snapshot.data.documents);
            },
          ),
        ],
      ),
    );
  }
}