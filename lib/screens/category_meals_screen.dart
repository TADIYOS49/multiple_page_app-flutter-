import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routearg['id'];
    categoryTitle = routearg['title'];
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              displayedMeals[index].title,
              displayedMeals[index].imageUrl,
              displayedMeals[index].duration,
              displayedMeals[index].complexity,
              displayedMeals[index].affordability,
              displayedMeals[index].id,
              _removeMeal);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
