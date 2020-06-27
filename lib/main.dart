import 'package:flutter/material.dart';

import './models/mealModel.dart';
import './helpers/dummy_data.dart';
import './screens/filterScreen.dart';
import './screens/homeBottomBar.dart';
import './screens/categoryMealDetail.dart';
import './screens/categoryMeals.dart';

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
  List<MealModel> _availableItem = DUMMY_MealS;
  List<MealModel> _favoriteMeals = [];
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableItem = DUMMY_MealS.where((item) {
        if (_filters["gluten"] && !item.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !item.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !item.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final _existingIndex =
        _favoriteMeals.indexWhere((item) => item.id == mealId);
    if (_existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(_existingIndex);
      });
    } else {
      _favoriteMeals.add(DUMMY_MealS.firstWhere((item) => item.id == mealId));
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((item) => item.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              headline5: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        // '/': (ctx) => HomeScreen(), // treated as home
        '/': (ctx) => HomeBottomBarScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableItem),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilter)
      },
    );
  }
}
