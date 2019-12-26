import 'package:flutter/material.dart';

void main() => runApp(MaterialApp());


/// This is the stateless widget that the main application instantiates.
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Ink(
          decoration: ShapeDecoration(
            color: Colors.green,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(Icons.android),
            color: Colors.white,
            onPressed: () {
              print("You Pressed the icon!");
            },
          ),
        ),
      ),
    );
  }
}