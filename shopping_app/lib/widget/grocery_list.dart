import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/data/dummy_category.dart';
import 'package:shopping_app/model/grocery.dart';
import 'package:shopping_app/widget/new_list.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItem = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final url = Uri.https(
        'fir-todo-app-38da2-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadItem = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadItem.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category),
      );
    }
    setState(() {
      _groceryItem = loadItem;
    });
    print(response.body);
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewListItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItem.add(newItem);
    });
    //_loadData();
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItem.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No Items added yet'),
    );
    if (_groceryItem.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: ((context, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(_groceryItem[index]);
              },
              key: ValueKey(_groceryItem[index].id),
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: ListTile(
                    title: Text(_groceryItem[index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: _groceryItem[index].category.color,
                    ),
                    trailing: Text(
                      _groceryItem[index].quantity.toString(),
                    ),
                  ),
                ),
              ),
            )),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
