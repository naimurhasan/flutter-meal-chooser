import 'package:flutter/material.dart';
import 'package:meal_chooser/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
            height: 190,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up', style: Theme.of(context).textTheme.display1),
          ),
          buildListTile(context, 'Meals', Icons.bubble_chart, (){
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile(context, 'Filters', Icons.tune, (){
            Navigator.pushReplacementNamed(context, FilterScreen.RouteName);
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String text, IconData iconData, Function callback) {
    return ListTile(
          onTap: callback,
          title: Text(text, style: TextStyle(fontSize: 25.0, color: Theme.of(context).primaryColor),),
          leading: Icon(iconData, color: Theme.of(context).primaryColor, size: 27.0,),
        );
  }
}
