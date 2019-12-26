import 'package:flutter/material.dart';
import 'package:tourism_app/model/query.dart';

import '../../configs/AppColors.dart';
import '../../data.dart';
import '../../widgets/poke_container.dart';
import 'widgets/category_list.dart';
import 'widgets/news_list.dart';
import 'widgets/search_bar.dart';

class Home extends StatefulWidget {
  static const cardHeightFraction = 0.7;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _cardHeight;
  ScrollController _scrollController;
  bool _showTitle;
  bool _showToolbarColor;

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);

    super.dispose();
  }

  @override
  void initState() {
    _cardHeight = 0;
    _showTitle = false;
    _showToolbarColor = false;
    _scrollController = ScrollController()..addListener(_onScroll);


  // TipServices().getCategories(oneData, twoData);


    super.initState();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final showTitle = _scrollController.offset > _cardHeight - kToolbarHeight;

    final showToolbarColor = _scrollController.offset > kToolbarHeight;

    if (showTitle != _showTitle || showToolbarColor != _showToolbarColor) {
      setState(() {
        _showTitle = showTitle;
        _showToolbarColor = showToolbarColor;
      });
    }
  }

  Widget _buildCard() {
    return PokeContainer(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      children: <Widget>[
        SizedBox(height: 117),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            "What Pokemon\nare you looking for?",
            style: TextStyle(
              fontSize: 30,
              height: 0.9,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: 40),
        SearchBar(),
        SizedBox(height: 42),
        CategoryList(),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    _cardHeight = screenHeight * Home.cardHeightFraction;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: CategoryList(),
      )
    );
  }
}
