import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _products = [];

  List<Map<String, dynamic>> get products => _products;

  void addProduct(Map<String, dynamic> product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(int index, Map<String, dynamic> product) {
    if (index >= 0 && index < _products.length) {
      _products[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
      notifyListeners();
    }
  }
}
