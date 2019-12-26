import 'package:tourism_app/paid_card.dart';
import 'package:flutter/material.dart';

class CardsHub extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
                child: PaidCardss(
                ),
              ),
            ),
        ),
      ),
    );
  }
}
