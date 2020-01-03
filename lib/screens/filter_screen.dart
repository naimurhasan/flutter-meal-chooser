import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_chooser/models/meal_config.dart';
import 'package:meal_chooser/views/main_drawer.dart';

class FilterScreen extends StatefulWidget {

  static const RouteName = '/FilterScreen';

  final MealConfig mealConfig;

  FilterScreen(this.mealConfig);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          buildSwitchListTile(
            title: 'Gluten Free',
            subtitle: 'Show only gluten free meals',
            isActive: widget.mealConfig.glutenFree,
            callBack: (value){
              setState(() {
                widget.mealConfig.glutenFree = value;
              });
            },
          ),
          buildSwitchListTile(
            title: 'Lactose Free',
            subtitle: 'Show only lactose free meals',
            isActive: widget.mealConfig.lactoseFree,
            callBack: (value){
              setState(() {
                widget.mealConfig.lactoseFree = value;
              });
            },
          ),
          buildSwitchListTile(
            title: 'Is Vegan',
            subtitle: 'Show only vegan meals',
            isActive: widget.mealConfig.isVegan,
            callBack: (value){
              setState(() {
                widget.mealConfig.isVegan = value;
              });
            },
          ),
          buildSwitchListTile(
            title: 'Is Vegiterian',
            subtitle: 'Show only vegiterian',
            isActive: widget.mealConfig.isVegetarian,
            callBack: (value){
              setState(() {
                widget.mealConfig.isVegetarian = value;
              });
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile({String title, String subtitle, bool isActive, Function callBack}) {
    return SwitchListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            value: isActive,
            onChanged: callBack);
  }
}
