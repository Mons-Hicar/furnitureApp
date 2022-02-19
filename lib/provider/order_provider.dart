import 'package:flutter/material.dart';

class Orders {
  int productId, quantity;
  double price;
  String imageName;

  Orders(this.productId, this.quantity, this.price, this.imageName);
}

class OrderList with ChangeNotifier {
  Map<String, Orders> _orderList = {};

  Map<String, Orders> get orders {
    return _orderList;
  }

  void addOrder(int productId, int quantity, double price, String imageName) {
    if (_orderList.containsKey(imageName)) {
      _orderList.update(
          imageName, (value) => Orders(productId, quantity, price, imageName));
    } else {
      _orderList.putIfAbsent(
          imageName, () => Orders(productId, quantity, price, imageName));
    }
    notifyListeners();
  }

  double getTotalAmount() {
    double totalPrice = 0.0;
    orders.forEach((key, orderItem) {
      totalPrice += orderItem.price * orderItem.quantity;
    });
    return totalPrice;
  }

  void removeOrder(String imageName) {
    if (!_orderList.containsKey(imageName)) {
      return;
    }
    if (_orderList[imageName].quantity > 1) {
      _orderList.update(imageName, (existingOrder) {
        return Orders(existingOrder.productId, existingOrder.quantity - 1,
            existingOrder.price, existingOrder.imageName);
      });
    } else {
      _orderList.remove(imageName);
    }
    notifyListeners();
  }
}
