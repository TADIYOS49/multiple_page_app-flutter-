import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routearg['id'];
    final categoryTitle = routearg['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              categoryMeal[index].title,
              categoryMeal[index].imageUrl,
              categoryMeal[index].duration,
              categoryMeal[index].complexity,
              categoryMeal[index].affordability,
              categoryMeal[index].id);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
