import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/material_community_icons.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/todo/main.dart';

import '../../data.dart';
import '../../models/pokemon.dart';
import '../../widgets/slide_up_panel.dart';
import 'widgets/info.dart';
import 'widgets/tab.dart';

class PokemonInfo extends StatefulWidget {
   PokemonInfo({this.post});


  final DocumentSnapshot post;

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  static const double _pokemonSlideOverflow = 20;

  AnimationController _cardController;
  AnimationController _cardHeightController;
  double _cardMaxHeight = 0.0;
  double _cardMinHeight = 0.0;
  GlobalKey _pokemonInfoKey = GlobalKey();

  @override
  void dispose() {
    _cardController.dispose();
    _cardHeightController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _cardController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _cardHeightController = AnimationController(vsync: this, duration: Duration(milliseconds: 220));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      final appBarHeight = 100 + 22 + IconTheme.of(context).size;

      final RenderBox pokemonInfoBox = _pokemonInfoKey.currentContext.findRenderObject();

      _cardMinHeight = screenHeight - pokemonInfoBox.size.height + _pokemonSlideOverflow;
      _cardMaxHeight = screenHeight - appBarHeight;

      _cardHeightController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      builder: (context) => _cardController,
      child: MultiProvider(
        providers: [ListenableProvider.value(value: _cardController)],
        child: Scaffold(
          body: Consumer<PokemonModel>(
            builder: (_, model, child) => AnimatedContainer(

              duration: Duration(milliseconds: 300),
              color: Colors.red,
              child: child,
            ),
            child: StreamBuilder(
              stream: Firestore.instance.collection("post").where("mainName",isEqualTo: oneData).where("travelName",isEqualTo: twoData).snapshots(),
              builder: (context, snapshot) {
            if(!snapshot.hasData) return Text('Loading Data..');
            return Stack(
                  children: <Widget>[
                    Image.network(snapshot.data.documents[0]["contentImage"]),
                    AnimatedBuilder(
                      animation: _cardHeightController,
                      child: PokemonTabInfo(),
                      builder: (context, child) {
                        return SlidingUpPanel(
                          controller: _cardController,
                          minHeight: _cardMinHeight * _cardHeightController.value,
                          maxHeight: _cardMaxHeight,
                          child: child,
                        );
                      },
                    ),
                    IntrinsicHeight(
                      child: Container(
                        key: _pokemonInfoKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 275,left: 13),
                          child: Column(children: <Widget>[

                            Padding(
                              padding: const EdgeInsets.only(right: 55),
                              child: Text(widget.post.data["contentTip"]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 55),
                              child: Text(widget.post.data["contentDescription"]),
                            )

                          ],),
                        ),

                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
