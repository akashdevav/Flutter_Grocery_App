import 'package:flutter/material.dart';
import 'package:shopping_app/model/grocery.dart';
import 'package:shopping_app/widget/new_list.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItem = [];

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
  }

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: ((context, index) => Card(
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
            )),
      ),
    );
  }
}
