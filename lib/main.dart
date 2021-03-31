import 'package:flutter/material.dart';

import './models/Meal.dart';
import './dummy_data.dart';

import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavouriteMeals(String mealId) {
    final mealIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (mealIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Bellota",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bellota'),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(toggleFavouriteMeals, isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
