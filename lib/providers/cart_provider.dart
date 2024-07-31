import 'package:flutter/material.dart';

import '../views/ui/categories/atta/atta.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addItem(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }

  double get discount {
    return _cartItems.fold(0, (sum, item) => sum + item.price) * 0.10; // Flat 10% discount for example
  }
}
