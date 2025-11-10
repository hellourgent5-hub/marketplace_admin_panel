import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/products_provider.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: provider.products.length,
        itemBuilder: (_, index) {
          final product = provider.products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('\$${product['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => provider.deleteProduct(product['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          provider.addProduct({'name': 'New Product', 'price': 0});
        },
      ),
    );
  }
}
