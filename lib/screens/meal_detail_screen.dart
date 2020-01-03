import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:meal_chooser/models/meal.dart';

class MealDetailScreen extends StatelessWidget{

  static const routeName = '/meal_details_screen';

  final List<String> favourites;
  MealDetailScreen(this.favourites);

  @override
  Widget build(BuildContext context){
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete), onPressed: (){Navigator.of(context).pop(mealId);})
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 280,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
            ),
            headingText(context, 'Ingredients'),
            ingredientListView(context, selectedMeal),
            headingText(context, 'Steps'),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey,width: 2)
              ),
              height: 150,
              width: 300,
              child: ListView.builder(itemBuilder: (ct, index){
                return index.isOdd ? Divider() : ListTile(
                  leading: CircleAvatar(child: Text('# ${index ~/ 2+1}'),),
                  title: Text(selectedMeal.steps[index ~/ 2]),
                );
              }, itemCount: selectedMeal.steps.length*2,),
            ),
          ],
        ),
      ),
      floatingActionButton: FAVbutton(favourites, mealId),
    );
  }

  Container ingredientListView(BuildContext context, Meal selectedMeal) {
    return Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey,width: 2)
          ),
          height: 150,
          width: 300,
          child: ListView.builder(itemBuilder: (ct, index){
            return Card(
                color: Theme.of(context).accentColor,
                child: Padding(padding: EdgeInsets.all(5.0),child: Text(selectedMeal.ingredients[index])));
          }, itemCount: selectedMeal.ingredients.length,),
        );
  }

  Padding headingText(BuildContext context, text) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: Theme.of(context).textTheme.title),
        );
  }
}

class FAVbutton extends StatefulWidget {
  final List<String> favourites;
  final String mealId;
  FAVbutton(this.favourites, this.mealId);
  @override
  _FAVbuttonState createState() => _FAVbuttonState();
}

class _FAVbuttonState extends State<FAVbutton> {

  bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.favourites.contains(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      onPressed: (){
        setState(() {
          isActive = !isActive;
          isActive ? widget.favourites.add(widget.mealId) : widget.favourites.remove(widget.mealId);
        });
      },
      child: Icon(isActive ? Icons.favorite : Icons.favorite_border),
    );
  }
}

