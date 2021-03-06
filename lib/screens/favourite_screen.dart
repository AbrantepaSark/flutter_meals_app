import 'package:flutter/material.dart';

import '../models/Meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet.'),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageURL: favouriteMeals[index].imageURL,
              duration: favouriteMeals[index].duration,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity);
        },
      );
    }
  }
}
