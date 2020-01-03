class MealConfig{
  bool glutenFree = false;
  bool lactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  String toString() {
    super.toString();
    return
      'Is configured: ${isMealConfigured()}\n'
       +'Glucose free: $glutenFree\n'
        +'Lactose free $lactoseFree\n'
        +'Is Vegan: $isVegan\n'
        +'Is Vegiterian: $isVegetarian';
  }

  bool isMealConfigured(){
    return (glutenFree || lactoseFree || isVegan || isVegetarian) ? true : false;
  }
}