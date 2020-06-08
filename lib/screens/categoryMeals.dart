import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CategoryMeals'),
      ),
      body: Container(
        child: Center(
          child: Text('Category Meals Section',style:TextStyle(color:Theme.of(context).primaryColor)),
        ),
      ),
    );
  }
}
