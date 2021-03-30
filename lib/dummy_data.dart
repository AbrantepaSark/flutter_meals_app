import 'package:flutter/material.dart';

import './models/Category.dart';
import './models/Meal.dart';

const DUMMY_CATEGORIES = const [
  CategoryModel(id: 'c1', title: 'Italian', color: Colors.purple),
  CategoryModel(id: 'c2', title: 'Quick & Easy', color: Colors.red),
  CategoryModel(id: 'c3', title: 'Humburgers', color: Colors.orange),
  CategoryModel(id: 'c4', title: 'German', color: Colors.amber),
  CategoryModel(id: 'c5', title: 'Light & Lovely', color: Colors.blue),
  CategoryModel(id: 'c6', title: 'Exotic', color: Colors.green),
  CategoryModel(id: 'c7', title: 'Breakfast', color: Colors.lightBlue),
  CategoryModel(id: 'c8', title: 'Asian', color: Colors.lightGreen),
  CategoryModel(id: 'c9', title: 'French', color: Colors.pink),
  CategoryModel(id: 'c10', title: 'Sumer', color: Colors.teal),
];

const DUMMY_MEALS = const [
  Meal(
      id: 'm1',
      categories: ['c1', 'c4', 'c6'],
      title: 'Special Salad',
      affordability: Affordability.Affordable,
      complexity: Complexity.Challenging,
      imageURL: 'assets/images/image1.jpg',
      ingredients: ['Pepper', 'Onion', 'Salads'],
      duration: 30,
      steps: ['Wash onion and pepper', 'Boil salad'],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: true),
  Meal(
      id: 'm2',
      categories: ['c6', 'c7', 'c8'],
      title: 'Special Jollof',
      affordability: Affordability.Luxurious,
      complexity: Complexity.Hard,
      imageURL: 'assets/images/image2.jpg',
      ingredients: ['Pepper', 'Onion', 'Rice'],
      duration: 50,
      steps: ['Wash onion and pepper', 'Boil rice'],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegan: true,
      isVegetarian: true),
  Meal(
      id: 'm3',
      categories: ['c2', 'c3', 'c8', 'c10'],
      title: 'Special Wakye',
      affordability: Affordability.Pricey,
      complexity: Complexity.Simple,
      imageURL: 'assets/images/image2.jpg',
      ingredients: ['Pepper', 'Onion', 'Beans', 'Rice'],
      duration: 30,
      steps: ['Wash onion and pepper', 'Boil beans and rice'],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: true),
  Meal(
      id: 'm4',
      categories: ['c1', 'c4', 'c8', 'c9'],
      title: 'Special Pizza',
      affordability: Affordability.Luxurious,
      complexity: Complexity.Hard,
      imageURL: 'assets/images/image1.jpg',
      ingredients: ['Pepper', 'Onion', 'Salads'],
      duration: 30,
      steps: ['Wash onion and pepper', 'Boil salad'],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: true),
  Meal(
      id: 'm5',
      categories: ['c3', 'c7', 'c9', '10'],
      title: 'Special Kenkey',
      affordability: Affordability.Affordable,
      complexity: Complexity.Simple,
      imageURL: 'assets/images/image2.jpg',
      ingredients: ['Pepper', 'Onion', 'Corn-dour'],
      duration: 30,
      steps: ['Wash onion and pepper', 'Boil corn-dour'],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: true),
];
