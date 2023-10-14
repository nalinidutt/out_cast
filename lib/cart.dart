import 'package:flutter/material.dart';

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
  List<GroceryItem> groceries = [
    GroceryItem(name: 'Apples', price: 2.5),
    GroceryItem(name: 'Bread', price: 1.0),
    GroceryItem(name: 'Milk', price: 0.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) {
          final item = groceries[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
