import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/data/dummy_category.dart';
import 'package:shopping_app/model/category.dart';

class NewListItem extends StatefulWidget {
  const NewListItem({super.key});

  @override
  State<NewListItem> createState() => _NewListItemState();
}

class _NewListItemState extends State<NewListItem> {
  final _formatKey = GlobalKey<FormState>();
  var _enterName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];

  void _saveItem() async {
    if (_formatKey.currentState!.validate()) {
      _formatKey.currentState!.save();

      final url = Uri.https('fir-todo-app-38da2-default-rtdb.firebaseio.com',
          'shopping-list.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'applications/json',
        },
        body: json.encode(
            {
              'name': _enterName,
              'quantity': _enteredQuantity,
              'category': _selectedCategory?.title
            },
          ),
      );
      print(response.body);
      print(response.statusCode);
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
          key: _formatKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name', style: TextStyle(color: Colors.black)),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Entered the character between 1 to 50';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _enterName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text(
                          'Quantity',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      initialValue: '1',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be valid and positive number';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 14,
                                    height: 14,
                                    color: category.value.color,
                                  ),
                                  Text(category.value.title),
                                ],
                              ),
                            )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _formatKey.currentState!.reset();
                    },
                    icon: const Icon(Icons.cancel),
                    label: const Text('Reset'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton.icon(
                    onPressed: _saveItem,
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
