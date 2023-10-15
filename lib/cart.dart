import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class GroceryItem {
  final String name;
  final double price;
  String category;

  GroceryItem({required this.name, required this.price, this.category = ''}); // Default to empty category
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<GroceryItem>? groceries;

  @override
  void initState() {
    super.initState();
    loadGroceries();
  }

  Future<void> loadGroceries() async {
    try {
      final data = await rootBundle.loadString('assets/groceries copy.csv');
      final rows = const CsvToListConverter().convert(data);

      setState(() {
        groceries = rows.map((row) => GroceryItem(name: row[2].toString(), price: double.parse(row[1].toString()))).toList();
      });
    } catch (e) {
      print('Error loading groceries: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: groceries == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: groceries!.length + 1, // +1 for the "At Home" header
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile();
                }
                final item = groceries![index - 1]; // -1 to adjust for the added header

                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      groceries!.removeAt(index - 1);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} removed')),
                    );
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: item.category == 'at home' ? Icon(Icons.home) : null, // Show home icon for items "at home"
                    onTap: () => _editItem(context, index - 1),
                  ),
                );
              },
            ),
    );
  }

  void _editItem(BuildContext context, int index) {
  final nameController = TextEditingController(text: groceries![index].name);
  final priceController = TextEditingController(text: groceries![index].price.toString());
  bool isAtHome = groceries![index].category == 'at home';

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Edit Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
          ListTile(
            title: Text("At Home"),
            leading: InkWell(
              onTap: () {
                setState(() {
                  isAtHome = !isAtHome;
                  if (isAtHome) {
                    groceries![index].category = 'at home';
                  } else {
                    groceries![index].category = '';
                  }
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0),
                ),
                child: isAtHome ? Icon(Icons.check, size: 18) : null,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Update'),
          onPressed: () {
            final updatedItem = GroceryItem(
              name: nameController.text,
              price: double.parse(priceController.text),
              category: isAtHome ? 'at home' : '', // Set the category based on checkbox state
            );

            setState(() {
              groceries![index] = updatedItem;
            });

            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
}