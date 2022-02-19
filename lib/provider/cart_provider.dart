import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/database/cartDB/cart_product.dart';
import 'package:rohi_furniture_app/database/database.dart';

class CartItem {
  int productId;
  final String title, imgUrl;
  final double price;

  CartItem(
      {@required this.productId,
      @required this.title,
      @required this.imgUrl,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return _items;
  }

  void addToCart(String productId, String title, double price, String imgUrl) {
    if (_items.containsKey(productId)) {
      return;
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              productId: int.parse(productId),
              title: title,
              price: price,
              imgUrl: imgUrl)); //CartItem
    }
    notifyListeners();
  }

  // this gives total items in the cart
  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  //this is used to remove item from the cart
  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  loadToCartDB() async {
    final database = await $FloorAppDatabase.databaseBuilder('Product').build();
    final cartDao = database.cartDao;
    cartDao.deleteAllCarts();
    for (int i = 0; i < _items.length; i++) {
      final product = ProductCartDB(
          _items.values.toList()[i].title,
          _items.values.toList()[i].imgUrl,
          _items.values.toList()[i].price,
          _items.values.toList()[i].productId);
      await cartDao.insertProduct(product);
    }
    print("added to cart");
  }

  loadFromCart() async {
    final database = await $FloorAppDatabase.databaseBuilder('Product').build();
    final cartDao = database.cartDao;
    List<ProductCartDB> _productCartDB = await cartDao.findAllProducts();
    if (_productCartDB.isEmpty) {
      _items.clear();
    } else {
      for (int i = 0; i < _productCartDB.length; i++) {
        addToCart(
            _productCartDB[i].productId.toString(),
            _productCartDB[i].productName,
            _productCartDB[i].productPrice,
            _productCartDB[i].imageName);
      }
    }
  }
}
