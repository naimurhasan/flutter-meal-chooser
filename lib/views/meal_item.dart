import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_chooser/models/meal.dart';
import 'package:meal_chooser/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    @required this.mealId,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem
  });

  _onSelectmeal(context) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: mealId)
        .then((result){
      if(result!=null){
        print('MEAL ID REMOVING: $result');
        removeItem(result);
      }

    });
  }

  String get complextiyText {
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){_onSelectmeal(context);},
      child: Card(
        margin: EdgeInsets.all(15.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5.0,
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Container(
                  child: Text(title,
                      textAlign: TextAlign.right,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white, fontSize: 22.0)),
                  constraints: (BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 35)),
                  color: Colors.black54,
                  padding: EdgeInsets.all(5.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(mainAxisAlignment:MainAxisAlignment.start, children: <Widget>[Icon(Icons.schedule), SizedBox(width: 5.0,), Text('$duration min')],),
                Row(mainAxisAlignment:MainAxisAlignment.start, children: <Widget>[Icon(Icons.work), SizedBox(width: 5.0,), Text(complextiyText)],),
                Row(mainAxisAlignment:MainAxisAlignment.start, children: <Widget>[Icon(Icons.attach_money), Text(affordabilityText, softWrap: true,overflow: TextOverflow.fade,)],),
              ],
            ),
          ),
        ]),
      ),
    );
  }

}
