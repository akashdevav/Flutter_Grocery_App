import 'package:flutter/material.dart';
import 'package:shopping_app/model/category.dart';

final categories = {
  Categories.vegetables: CategoryModel('Vegetables', const Color.fromARGB(255, 127, 223, 131)),
  Categories.fruits: CategoryModel('Fruits', const Color.fromARGB(255, 224, 207, 14)),
  Categories.meat: CategoryModel('Meat', const Color.fromARGB(255, 232, 25, 7)),
  Categories.diary: CategoryModel('Diary', const Color.fromARGB(255, 246, 249, 246)),
  Categories.snacks: CategoryModel('Snacks', const Color.fromARGB(255, 58, 33, 133)),
  Categories.greens: CategoryModel('Greens', const Color.fromARGB(255, 13, 77, 15)),
  Categories.nuts: CategoryModel('Nuts', const Color.fromARGB(255, 119, 113, 136)),
  Categories.herbs: CategoryModel('Herbs', const Color.fromARGB(255, 67, 206, 102)),
  Categories.others: CategoryModel('Others', const Color.fromARGB(252, 150, 51, 177)),
};
