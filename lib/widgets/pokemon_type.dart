import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType(this.label, {Key key, this.large = false}) : super(key: key);

  final String label;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 19 : 12,
          vertical: large ? 6 : 4,
        ),


      ),
    );
  }
}
