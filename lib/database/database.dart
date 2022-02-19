import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rohi_furniture_app/database/cartDB/cart_product.dart';
import 'package:rohi_furniture_app/database/productDB.dart';
import 'package:rohi_furniture_app/database/product_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'cartDB/cart_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ProductDB, ProductCartDB])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
  CartDao get cartDao;
}
