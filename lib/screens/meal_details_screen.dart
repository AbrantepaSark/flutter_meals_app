import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function toggleFavourite;
  final Function isFavourite;
  MealDetailsScreen(this.toggleFavourite, this.isFavourite);

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 150,
        width: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                mealDetails.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 1),
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(mealDetails.ingredients[index]),
                    ),
                  );
                },
                itemCount: mealDetails.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 1),
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(mealDetails.steps[index]),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  );
                },
                itemCount: mealDetails.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealDetails.id) ? Icons.star : Icons.star_border,
          size: 30,
        ),
        onPressed: () {
          toggleFavourite(mealDetails.id);
        },
      ),
    );
  }
}
