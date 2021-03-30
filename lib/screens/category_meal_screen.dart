import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meal';
  // final String catID;
  // final String catTitle;
  // CategoryMeals(this.catID, this.catTitle);
  @override
  Widget build(BuildContext context) {
    //We get access to data to our routed page
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final catMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemCount: catMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
              id: catMeals[index].id,
              title: catMeals[index].title,
              imageURL: catMeals[index].imageURL,
              duration: catMeals[index].duration,
              affordability: catMeals[index].affordability,
              complexity: catMeals[index].complexity);
        },
      ),
    );
  }
}
