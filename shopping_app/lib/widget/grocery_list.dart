import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_item.dart';
import 'package:shopping_app/widget/new_list.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewListItem(),
      ),
    );
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
        itemCount: groceryItem.length,
        itemBuilder: ((context, index) => Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: ListTile(
                  title: Text(groceryItem[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: groceryItem[index].category.color,
                  ),
                  trailing: Text(
                    groceryItem[index].quantity.toString(),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
