import 'package:flutter/material.dart';
import 'package:meal_chooser/dummy_data.dart';
import 'package:meal_chooser/models/meal.dart';
import 'package:meal_chooser/views/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories_meals_screen';
  final mealConfig;
  CategoryMealsScreen(this.mealConfig);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool alreadyLoaded = false;
  String title;
  List<Meal> categoryMeals;


  removeMeal(String mealId){
    setState(() {
      ;
    });
  }

  @override
  Widget build(BuildContext context) {


    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routeArgs['title'];
    final id = routeArgs['id'];
    if(!alreadyLoaded){
      categoryMeals =
        DUMMY_MEALS.where((meal){

            if(!widget.mealConfig.isMealConfigured()){
              //no config definded show all on seleected category
              return meal.categories.contains(id);
            }else{
              if(meal.categories.contains(id)){

                if(widget.mealConfig.glutenFree)
                  return meal.isGlutenFree;

                if(widget.mealConfig.lactoseFree)
                  return meal.isLactoseFree;

                if(widget.mealConfig.isVegan)
                  return meal.isVegan;

                if(widget.mealConfig.isVegetarian)
                  return meal.isVegetarian;

                return true;

              }

              return false;
            }


        }
        ).toList();
      alreadyLoaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}
