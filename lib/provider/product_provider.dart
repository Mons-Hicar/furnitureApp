import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:rohi_furniture_app/database/database.dart';
import 'package:rohi_furniture_app/database/productDB.dart';
import 'package:rohi_furniture_app/database/save_to_database.dart';
import 'package:rohi_furniture_app/provider/localProduct.dart';

class ProductProvider with ChangeNotifier {
  List<LocalProduct> _productList = [];

  Future<String> getProductFromServer() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      SaveToDB saveToDB = new SaveToDB();
      await saveToDB.loadProductsToDB();
    }
    return "Success";
  }

  // return list of all products
  Future<List<LocalProduct>> getProductFromDB() async {
    // Timer.periodic(Duration(milliseconds: 2000), (timer) {
    //   getProductFromServer();
    // });

    String flag = await getProductFromServer();
    print("Call to SERVER: $flag");
    final database = await $FloorAppDatabase.databaseBuilder('Product').build();
    final productDao = database.productDao;
    try {
      List<ProductDB> _productListDB = await productDao.findAllProducts();
      for (int i = 0; i < _productListDB.length; i++) {
        LocalProduct newLocalProduct = new LocalProduct(
            id: _productListDB[i].id,
            productName: _productListDB[i].productName,
            description: _productListDB[i].description,
            availableColors: _productListDB[i].availableColors,
            availableSizes: _productListDB[i].availableSizes,
            categoryId: _productListDB[i].categoryId,
            dealerPrice: _productListDB[i].dealerPrice,
            enabled: _productListDB[i].enabled,
            inStock: _productListDB[i].enabled,
            retailerPrice: _productListDB[i].retailerPrice,
            subCategoryId: _productListDB[i].subCategoryId,
            imageName: _productListDB[i].imageName,
            isFavourite: _productListDB[i].isFavourite);
        _productList.add(newLocalProduct);
      }
    } catch (e) {
      throw e;
    }
    return _productList;
  }

  //get all products
  List<LocalProduct> get products {
    return [..._productList];
  }

  //get product by id
  LocalProduct findById(int id) {
    return _productList.firstWhere((prod) {
      return prod.id == id;
    });
  }

  //get product by category
  List<LocalProduct> findByCategory(int categoryId) {
    return _productList.where((prod) {
      return prod.categoryId == categoryId;
    }).toList();
  }

  //getProduct by sub category
  List<LocalProduct> findBySubCategory(int subCategoryId) {
    return _productList.where((prod) {
      return prod.subCategoryId == subCategoryId;
    }).toList();
  }

  //get favourite product
  List<LocalProduct> get favourites {
    return _productList.where((prodItem) {
      return prodItem.isFavourite;
    }).toList();
  }
}
