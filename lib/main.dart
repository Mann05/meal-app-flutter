import 'package:flutter/material.dart';
import './screens/filterScreen.dart';
import './screens/homeBottomBar.dart';
import './screens/categoryMealDetail.dart';
import './screens/categoryMeals.dart';
import './screens/categories.dart';
import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (ctx) => HomeBottomBarScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen()
      },
    );
  }
}
