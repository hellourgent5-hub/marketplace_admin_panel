import 'package:flutter/material.dart';
import '../products/products_page.dart';
import '../orders/orders_page.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel Dashboard')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Manage Products'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProductsPage()),
            ),
          ),
          ListTile(
            title: Text('Manage Orders'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OrdersPage()),
            ),
          ),
        ],
      ),
    );
  }
}
