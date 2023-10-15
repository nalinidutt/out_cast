import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class GroceryItem {
  final String name;
  final double price;
  String category;

  GroceryItem({required this.name, required this.price, this.category = ''});
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

  void _addGrocery() {
    final nameController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Grocery Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Add'),
            onPressed: () {
              if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
                final newItem = GroceryItem(
                  name: nameController.text,
                  price: double.parse(priceController.text),
                );

                setState(() {
                  groceries!.add(newItem);
                });

                Navigator.of(context).pop();
              } else {
                // You can handle the case when fields are empty, maybe by showing an error message.
              }
            },
          ),
        ],
      ),
    );
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

  double get checkoutAmount {
    if (groceries == null) return 0.0;
    return groceries!
        .where((item) => item.category != 'at home')
        .fold(0.0, (sum, item) => sum + item.price);
  }

  void _editItem(BuildContext context, int index) {
  final nameController = TextEditingController(text: groceries![index].name);
  final priceController = TextEditingController(text: groceries![index].price.toString());
  bool isAtHome = groceries![index].category == 'at home';

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder( // Use StatefulBuilder to update state within showDialog
      builder: (context, setModalState) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
              TextField(controller: priceController, decoration: InputDecoration(labelText: 'Price'), keyboardType: TextInputType.number),
              CheckboxListTile(
                title: Text("At Home"),
                value: isAtHome,
                onChanged: (newValue) {
                  setModalState(() { // Update the local state for immediate feedback
                    isAtHome = newValue!;
                  });
                },
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
                  category: isAtHome ? 'at home' : '',
                );

                setState(() {
                  groceries![index] = updatedItem;
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    ),
  );
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Checkout'),
                  content: Text('Total Amount: \$${checkoutAmount.toStringAsFixed(2)}'),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'Checkout: \$${checkoutAmount.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: groceries == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: groceries!.length,
              itemBuilder: (context, index) {
                final item = groceries![index];
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15.0),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.green.shade200,
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    trailing: item.category == 'at home'
                        ? Icon(Icons.home, color: Colors.teal)
                        : null,
                    onTap: () => _editItem(context, index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addGrocery,
      ),
    );
  }
}
