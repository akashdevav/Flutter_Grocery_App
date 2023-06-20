import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruits,
  meat,
  diary,
  snacks,
  greens,
  nuts,
  herbs,
  others
}

class CategoryModel {
  CategoryModel(this.title, this.color);

  final String title;
  final Color color;
}