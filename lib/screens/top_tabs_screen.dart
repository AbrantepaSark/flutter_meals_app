//Not showing in project
//But for reference on how
//to create a top tab bars
//for any app

import 'package:flutter/material.dart';

import '../models/Meal.dart';

import './categories_screen.dart';
import './favourite_screen.dart';

class TopTabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TopTabsScreen(this.favouriteMeal);
  @override
  _TopTabsScreenState createState() => _TopTabsScreenState();
}

class _TopTabsScreenState extends State<TopTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Deli-Meals',
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavouriteScreen(widget.favouriteMeal)],
        ),
      ),
    );
  }
}
