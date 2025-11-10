import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsProvider extends ChangeNotifier {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  List<Map<String, dynamic>> products = [];

  ProductsProvider() {
    fetchProducts();
  }

  void fetchProducts() {
    productsCollection.snapshots().listen((snapshot) {
      products = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
      notifyListeners();
    });
  }

  Future<void> addProduct(Map<String, dynamic> product) async {
    await productsCollection.add(product);
  }

  Future<void> deleteProduct(String id) async {
    await productsCollection.doc(id).delete();
  }
}
