import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final num price;
  final String imgURL;

  Cart(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price,
      @required this.imgURL});
}

// Cart Provider
class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemsCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.quantity;
    });

    return total;
  }

  void addItem({beerId, price, title, imgURL}) {
    if (_cartItems.containsKey(beerId)) {
      _cartItems.update(
          beerId,
          (ex) => Cart(
              id: ex.id,
              title: ex.title,
              quantity: ex.quantity + 1,
              price: ex.price,
              imgURL: ex.imgURL));
    } else {
      _cartItems.putIfAbsent(
          beerId,
          () => Cart(
              id: '${DateTime.now()}',
              title: title,
              quantity: 1,
              price: price,
              imgURL: imgURL));
    }
    // Добавление слушателя
    notifyListeners();
  }

  void deleteItem(String beerId) {
    _cartItems.remove(beerId);
    notifyListeners();
  }

  // Обновление корзины +единица товара
  void updateItemsPlusOne(String beerId) {
    _cartItems.update(
        beerId,
        (ex) => Cart(
            id: ex.id,
            title: ex.title,
            quantity: ex.quantity + 1,
            price: ex.price,
            imgURL: ex.imgURL));
    // Добавление слушателя
    notifyListeners();
  }

  // Обновление корзины -единица товара
  void updateItemsMinusOne(String beerId) {
    if (_cartItems[beerId].quantity < 2) {
      deleteItem(beerId);
    } else {
      _cartItems.update(
          beerId,
          (ex) => Cart(
              id: ex.id,
              title: ex.title,
              quantity: ex.quantity - 1,
              price: ex.price,
              imgURL: ex.imgURL));
    }
    // Добавление слушателя
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
