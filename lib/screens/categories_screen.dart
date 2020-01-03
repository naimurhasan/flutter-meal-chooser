import 'package:meal_chooser/views/category_item.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{

  static const routeName = '/categories_screen';
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10.0),
        children:
        DUMMY_CATEGORIES.map((catData)=>CategoryItem(categoryId: catData.id, title: catData.title,color: catData.color,)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
      ),
    );
  }

}