import 'package:flutter/material.dart';
import './screens/categoryMeals.dart';

import './screens/categories.dart';

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
        '/' : (ctx)=> CategoriesScreen(), // treated as home
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      },
    );
  }
}
