import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class GroceryItem {
  final String name;
  final double price;

  GroceryItem({required this.name, required this.price});
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
              itemCount: groceries!.length,
              itemBuilder: (context, index) {
                final item = groceries![index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      groceries!.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} removed')),
                    );
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    onTap: () => _editItem(context, index),
                  ),
                );
              },
            ),
    );
  }

  void _editItem(BuildContext context, int index) {
    final nameController = TextEditingController(text: groceries![index].name);
    final priceController = TextEditingController(text: groceries![index].price.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Item'),
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
            child: Text('Update'),
            onPressed: () {
              final updatedItem = GroceryItem(
                name: nameController.text,
                price: double.parse(priceController.text),
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