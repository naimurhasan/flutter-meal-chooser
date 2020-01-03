import 'package:flutter/material.dart';
import 'package:meal_chooser/screens/categories_screen.dart';
import 'package:meal_chooser/screens/favourite_screen.dart';
import 'package:meal_chooser/views/main_drawer.dart';

class TabBarScreen extends StatefulWidget {

  final List<String> favourites;

  TabBarScreen(this.favourites);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

  int _selectedIndex = 0;

  updatePageIndex(int value){
    setState(() {
      _selectedIndex = value;
    });
  }

  List<Map<String, Object>> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      {'title': 'Categories', 'page': CategoriesScreen()},
      {'title': 'Favourites', 'page': FavouriteScreen(widget.favourites)},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: updatePageIndex,
          currentIndex: _selectedIndex,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('Categories'), backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favourites'), backgroundColor: Theme.of(context).primaryColor),
          ]),
    );
  }
}
