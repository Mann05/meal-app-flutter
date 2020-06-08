import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String categoryTitle;
  final Color categoryColor;

  const CategoryModel({
    @required this.id,
    @required this.categoryTitle,
    this.categoryColor = Colors.amber,
  });
}
