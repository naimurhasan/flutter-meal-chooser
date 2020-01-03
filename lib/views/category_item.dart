import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget{
  CategoryItem({this.categoryId, this.title, this.color});
  final String categoryId;
  final String title;
  final Color color;
  
  _goToSelectedCategory(BuildContext ctx){
     Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {'id': categoryId, 'title': title});
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){_goToSelectedCategory(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(title, style: Theme.of(context).textTheme.title,),
      ),
    );
  }

}