import 'package:floor/floor.dart';

@entity
class ProductCartDB {
  @PrimaryKey(autoGenerate: true)
  int id;
  String productName, imageName;
  double productPrice;
  int productId;

  ProductCartDB(
      this.productName, this.imageName, this.productPrice, this.productId);
}
