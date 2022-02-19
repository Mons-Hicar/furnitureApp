import 'package:flutter/material.dart';

class FavouriteProducts {
  int id;

  FavouriteProducts(this.id);
}

class FavouriteProductsProvider with ChangeNotifier {
  List<FavouriteProducts> _favouriteProducts = [];
  List<FavouriteProducts> get favourite {
    return [..._favouriteProducts];
  }

  void addFavouriteProduct(int id) {
    _favouriteProducts.add(FavouriteProducts(id));
    print(_favouriteProducts);
    notifyListeners();
  }

  void removeFavouriteProduct(int id) {
    _favouriteProducts.removeWhere((prodId) => prodId.id == id);
    notifyListeners();
  }
}
