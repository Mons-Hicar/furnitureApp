import 'package:floor/floor.dart';

@entity
class ProductDB {
  @PrimaryKey(autoGenerate: true)
  int databaseID;
  int id, categoryId, subCategoryId, inStock, enabled;
  String productName,
      description,
      dealerPrice,
      retailerPrice,
      availableColors,
      imageName,
      availableSizes;
  bool isFavourite;

  ProductDB(
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
}
