// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductDao _productDaoInstance;

  CartDao _cartDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductDB` (`databaseID` INTEGER PRIMARY KEY AUTOINCREMENT, `id` INTEGER, `categoryId` INTEGER, `subCategoryId` INTEGER, `inStock` INTEGER, `enabled` INTEGER, `productName` TEXT, `description` TEXT, `dealerPrice` TEXT, `retailerPrice` TEXT, `availableColors` TEXT, `imageName` TEXT, `availableSizes` TEXT, `isFavourite` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductCartDB` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `productName` TEXT, `imageName` TEXT, `productPrice` REAL, `productId` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productDBInsertionAdapter = InsertionAdapter(
            database,
            'ProductDB',
            (ProductDB item) => <String, dynamic>{
                  'databaseID': item.databaseID,
                  'id': item.id,
                  'categoryId': item.categoryId,
                  'subCategoryId': item.subCategoryId,
                  'inStock': item.inStock,
                  'enabled': item.enabled,
                  'productName': item.productName,
                  'description': item.description,
                  'dealerPrice': item.dealerPrice,
                  'retailerPrice': item.retailerPrice,
                  'availableColors': item.availableColors,
                  'imageName': item.imageName,
                  'availableSizes': item.availableSizes,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _productDBMapper = (Map<String, dynamic> row) => ProductDB(
      id: row['id'] as int,
      categoryId: row['categoryId'] as int,
      subCategoryId: row['subCategoryId'] as int,
      inStock: row['inStock'] as int,
      productName: row['productName'] as String,
      description: row['description'] as String,
      dealerPrice: row['dealerPrice'] as String,
      retailerPrice: row['retailerPrice'] as String,
      availableColors: row['availableColors'] as String,
      imageName: row['imageName'] as String,
      availableSizes: row['availableSizes'] as String,
      enabled: row['enabled'] as int,
      isFavourite:
          row['isFavourite'] == null ? null : (row['isFavourite'] as int) != 0);

  final InsertionAdapter<ProductDB> _productDBInsertionAdapter;

  @override
  Future<List<ProductDB>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM ProductDB',
        mapper: _productDBMapper);
  }

  @override
  Future<void> insertProduct(ProductDB productDB) async {
    await _productDBInsertionAdapter.insert(
        productDB, OnConflictStrategy.abort);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productCartDBInsertionAdapter = InsertionAdapter(
            database,
            'ProductCartDB',
            (ProductCartDB item) => <String, dynamic>{
                  'id': item.id,
                  'productName': item.productName,
                  'imageName': item.imageName,
                  'productPrice': item.productPrice,
                  'productId': item.productId
                }),
        _productCartDBUpdateAdapter = UpdateAdapter(
            database,
            'ProductCartDB',
            ['id'],
            (ProductCartDB item) => <String, dynamic>{
                  'id': item.id,
                  'productName': item.productName,
                  'imageName': item.imageName,
                  'productPrice': item.productPrice,
                  'productId': item.productId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _productCartDBMapper = (Map<String, dynamic> row) =>
      ProductCartDB(row['productName'] as String, row['imageName'] as String,
          row['productPrice'] as double, row['productId'] as int);

  final InsertionAdapter<ProductCartDB> _productCartDBInsertionAdapter;

  final UpdateAdapter<ProductCartDB> _productCartDBUpdateAdapter;

  @override
  Future<List<ProductCartDB>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM ProductCartDB',
        mapper: _productCartDBMapper);
  }

  @override
  Future<void> deleteAllCarts() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ProductCartDB');
  }

  @override
  Future<void> insertProduct(ProductCartDB productCartDB) async {
    await _productCartDBInsertionAdapter.insert(
        productCartDB, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateProduct(ProductCartDB productCartDB) {
    return _productCartDBUpdateAdapter.updateAndReturnChangedRows(
        productCartDB, OnConflictStrategy.abort);
  }
}
