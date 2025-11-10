import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersProvider extends ChangeNotifier {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  List<Map<String, dynamic>> orders = [];

  OrdersProvider() {
    fetchOrders();
  }

  void fetchOrders() {
    ordersCollection.snapshots().listen((snapshot) {
      orders = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
      notifyListeners();
    });
  }

  Future<void> assignDelivery(String orderId, String deliveryManId) async {
    await ordersCollection.doc(orderId).update({'deliveryManId': deliveryManId, 'deliveryAssigned': true});
  }
}
