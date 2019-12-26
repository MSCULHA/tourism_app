import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/data.dart' as prefix0;
import 'HomePage.dart';
import 'data.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:tourism_app/blocs/app_bloc.dart';
import 'package:tourism_app/blocs/bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/query.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AppBloc appBloc;

  @override
  void initState(){
    super.initState();
    getLocalData();
    getPurchaseHistory();
    initIAPs();

    appBloc = BlocProvider.of<AppBloc>(context);
    AppCenter.start(app_secret, [AppCenterAnalytics.id]);
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Homes(),
      image: Image(image: AssetImage('assets/pubStoryLogo.png'),fit: BoxFit.fitWidth,),
      backgroundColor: Color(0xFFee3f46),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white,

      title:Text(
        "FRIENDLY FIRE",
        style: TextStyle(
            color:Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.bold,fontFamily: 'Chewy'),

      ),
    );
  }
}