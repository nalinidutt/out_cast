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
  itemCount: groceries!.length,
  itemBuilder: (context, index) {
    final item = groceries![index];

    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        leading: CircleAvatar(
          child: Icon(Icons.fastfood, color: Colors.white,),  // Placeholder icon, you can replace it with more specific icons if needed.
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
            : null, // Show home icon for items "at home"
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

}
