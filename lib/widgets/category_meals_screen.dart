import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(itemBuilder: (ctx,index){

      },itemCount: ,),
    );
  }
}
