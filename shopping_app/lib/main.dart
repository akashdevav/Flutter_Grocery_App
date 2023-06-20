import 'package:flutter/material.dart';
import 'package:shopping_app/widget/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(233, 20, 55, 55),
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 41, 39, 44)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 13, 84, 85)
        
      ),
      home: const GroceryList(),
    );
  }
}