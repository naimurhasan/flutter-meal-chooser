import 'package:flutter/material.dart';
import 'package:meal_chooser/models/meal_config.dart';
import 'package:meal_chooser/screens/category_meals_screen.dart';
import 'package:meal_chooser/screens/filter_screen.dart';
import 'package:meal_chooser/screens/meal_detail_screen.dart';
import 'package:meal_chooser/screens/tab_bar_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final MealConfig mealConfig = MealConfig();
  final List<String> favourites = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 16,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          display1: TextStyle(
            fontSize: 30,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabBarScreen(favourites),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(mealConfig),
        MealDetailScreen.routeName : (context) => MealDetailScreen(favourites),
        FilterScreen.RouteName : (context) => FilterScreen(mealConfig),
      },
    );
  }
}

