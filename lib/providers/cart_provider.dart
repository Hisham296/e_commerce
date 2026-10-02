import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount {
    return _items.fold(0, (total, item) => total + item.quantity);
  }

  double get totalPrice {
    return _items.fold(0, (total, item) => total + item.totalPrice);
  }

  void addToCart(Product product) {
    final existingItemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }

    notifyListeners();
  }

  void increaseQuantity(Product product) {
    final itemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (itemIndex != -1) {
      _items[itemIndex].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    final itemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (itemIndex == -1) return;

    if (_items[itemIndex].quantity > 1) {
      _items[itemIndex].quantity--;
    } else {
      _items.removeAt(itemIndex);
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
