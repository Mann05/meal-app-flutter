import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/mealModel.dart';

class FavoriteScreen extends StatelessWidget {
  final List<MealModel> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have not favorites yet - start adding some !'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (_, index) {
          return Container(
            child: MealItem(
              item: favoriteMeals[index],
              // removedItem: _removeMeal,
            ),
          );
        },
      );
    }
  }
}
