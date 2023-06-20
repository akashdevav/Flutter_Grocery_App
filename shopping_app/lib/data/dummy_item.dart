import 'package:shopping_app/data/dummy_category.dart';
import 'package:shopping_app/model/category.dart';
import 'package:shopping_app/model/grocery.dart';

final groceryItem = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.diary]!),
      GroceryItem(
      id: 'b',
      name: 'chicken',
      quantity: 1,
      category: categories[Categories.meat]!),
      GroceryItem(
      id: 'c',
      name: 'apple',
      quantity: 3,
      category: categories[Categories.fruits]!)
];
