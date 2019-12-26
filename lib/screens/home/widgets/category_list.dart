import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/data.dart';
import 'package:tourism_app/paid_card.dart';

import '../../../data/categories.dart';
import '../../../testData.dart';
import '../../../widgets/poke_category_card.dart';
int indexHolder;
class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
          ),
          padding: EdgeInsets.only(left: 28, right: 28, bottom: 45),
          itemCount: theToDoLista.length,
          itemBuilder: (context, index) => PokeCategoryCard(


            indexHolder = index,
            onPress: () {
              Navigator.of(context).pushNamed("/todo");



            },


          ) ,
        ),
      ),
    );
  }
}



