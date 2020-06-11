import 'package:flutter/material.dart';
import 'package:meals/screens/categoryMeals.dart';
import '../models/categoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryMealScreen.routeName,
            arguments: {'id': category.id, 'title': category.categoryTitle});
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.categoryColor.withOpacity(0.4),
            category.categoryColor,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            category.categoryTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
