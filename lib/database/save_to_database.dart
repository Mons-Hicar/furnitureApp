import 'dart:async';

import 'package:rohi_furniture_app/database/productDB.dart';
import 'package:rohi_furniture_app/server%20handler/product_server.dart';
import 'package:rohi_furniture_app/server%20handler/services.dart';

import 'database.dart';

class SaveToDB {
  loadProductsToDB() async {
    final database = await $FloorAppDatabase.databaseBuilder('Product').build();
    final productDao = database.productDao;

    try {
      final List<ProductDB> productFromDB = await productDao.findAllProducts();
      List<Product> productFromServer = await Services.getProducts();
      if (productFromDB.isEmpty) {
        for (int i = 0; i < productFromServer.length; i++) {
          ProductDB product = ProductDB(
              id: productFromServer[i].id,
              productName: productFromServer[i].productName,
              description: productFromServer[i].description,
              availableColors: productFromServer[i].availableColors,
              availableSizes: productFromServer[i].availableSizes,
              categoryId: productFromServer[i].categoryId,
              dealerPrice: productFromServer[i].dealerPrice,
              enabled: productFromServer[i].enabled,
              inStock: productFromServer[i].enabled,
              retailerPrice: productFromServer[i].retailerPrice,
              subCategoryId: productFromServer[i].subcategoryId,
              imageName: productFromServer[i].image,
              isFavourite: false);
          await productDao.insertProduct(product);
        }
      } else {
        for (int i = 0; i < productFromServer.length; i++) {
          //check if database is empty
          if (productFromDB.isNotEmpty) {
            //check if user is present in database
            for (int j = 0; j < productFromDB.length; j++) {
              if (productFromDB[i].id != productFromServer[i].id) {
                final product = ProductDB(
                    id: productFromServer[i].id,
                    productName: productFromServer[i].productName,
                    description: productFromServer[i].description,
                    availableColors: productFromServer[i].availableColors,
                    availableSizes: productFromServer[i].availableSizes,
                    categoryId: productFromServer[i].categoryId,
                    dealerPrice: productFromServer[i].dealerPrice,
                    enabled: productFromServer[i].enabled,
                    inStock: productFromServer[i].enabled,
                    retailerPrice: productFromServer[i].retailerPrice,
                    subCategoryId: productFromServer[i].subcategoryId,
                    imageName: productFromServer[i].image,
                    isFavourite: false);
                await productDao.insertProduct(product);
              } else {
                return;
              }
            }
          }
        }
      }
    } catch (e) {
      throw e;
    }
  }
}
