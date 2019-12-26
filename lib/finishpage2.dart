import 'package:flutter/material.dart';
import 'paid_card.dart';


class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(

          resizeToAvoidBottomInset : false,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xFFee3f46),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}
