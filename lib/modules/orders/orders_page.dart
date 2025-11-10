import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/orders_provider.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: ListView.builder(
        itemCount: provider.orders.length,
        itemBuilder: (_, index) {
          final order = provider.orders[index];
          return ListTile(
            title: Text('Order ID: ${order['id']}'),
            subtitle: Text('Status: ${order['status']}'),
            trailing: ElevatedButton(
              child: Text('Assign Delivery'),
              onPressed: () => provider.assignDelivery(order['id'], 'deliveryMan1'),
            ),
          );
        },
      ),
    );
  }
}
