import 'package:flutter/material.dart';

class LocalProduct with ChangeNotifier {
  int id, categoryId, subCategoryId, inStock, enabled;
  String productName,
      description,
      dealerPrice,
      retailerPrice,
      availableColors,
      imageName,
      availableSizes;
  bool isFavourite;

  LocalProduct(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.inStock,
      this.productName,
      this.description,
      this.dealerPrice,
      this.retailerPrice,
      this.availableColors,
      this.imageName,
      this.availableSizes,
      this.enabled,
      this.isFavourite});

  bool toggleIsFavourite() {
    isFavourite = !isFavourite;
    return isFavourite;
  }
}
