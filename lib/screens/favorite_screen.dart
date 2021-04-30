import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  //constructor
  FavoriteScreen(this.favoriteMeals);
  
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              favoriteMeals[index].title,
              favoriteMeals[index].imageUrl,
              favoriteMeals[index].duration,
              favoriteMeals[index].complexity,
              favoriteMeals[index].affordability,
              favoriteMeals[index].id,
              );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
