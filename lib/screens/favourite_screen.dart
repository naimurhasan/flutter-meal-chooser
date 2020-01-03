import 'package:flutter/cupertino.dart';
import 'package:meal_chooser/dummy_data.dart';
import 'package:meal_chooser/models/meal.dart';
import 'package:meal_chooser/views/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  List<String> favourites;
  FavouriteScreen(this.favourites);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Meal> categoryMeals;

  removeMeal(String mealId){
      setState(() {
        widget.favourites.remove(mealId);
      });
  }

  @override
  Widget build(BuildContext context) {
    categoryMeals = DUMMY_MEALS.where((meal) => widget.favourites.contains(meal.id)).toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int postion){
        final meal = categoryMeals[postion];
        return MealItem(
          mealId: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          affordability: meal.affordability,
          complexity: meal.complexity,
          removeItem: removeMeal,
        );
      },
      itemCount: categoryMeals.length,
    );
  }
}
