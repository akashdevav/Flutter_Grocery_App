import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_category.dart';

class NewListItem extends StatefulWidget {
  const NewListItem({super.key});

  @override
  State<NewListItem> createState() => _NewListItemState();
}

class _NewListItemState extends State<NewListItem> {
  final _formatKey = GlobalKey<FormState>();

  void _saveItem() {    
    _formatKey.currentState!.validate();
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
                  if(value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50){
                    return 'Entered the character between 1 to 50'; 
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity',
                            style: TextStyle(color: Colors.black)),
                      ),
                      initialValue: '1',
                      validator: (value) {
                  if(value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! <= 0){
                    return 'Must be valid and positive number';
                  } else {
                    return null;
                  }
                },
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(items: [
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
                    ], onChanged: (value) {}),
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
