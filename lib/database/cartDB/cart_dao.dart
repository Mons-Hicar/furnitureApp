import 'package:floor/floor.dart';
import 'package:rohi_furniture_app/database/cartDB/cart_product.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM ProductCartDB')
  Future<List<ProductCartDB>> findAllProducts();

  @insert
  Future<void> insertProduct(ProductCartDB productCartDB);

  @update
  Future<int> updateProduct(ProductCartDB productCartDB);

  @Query('DELETE FROM ProductCartDB')
  Future<void> deleteAllCarts();
}
