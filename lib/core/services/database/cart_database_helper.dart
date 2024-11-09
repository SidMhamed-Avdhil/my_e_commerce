import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $tableCartProduct(
          $columnComputerId TEXT NOT NULL,
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL,
          $columnPrice TEXT NOT NULL)
          ''');
    });
  }

  Future<List<CartModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);

    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartModel cartModel) async {
    var dbClient = await database;

    await dbClient.insert(
      tableCartProduct,
      cartModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartModel cartModel) async {
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, cartModel.toJson(),
        where: '$columnComputerId = ?', whereArgs: [cartModel.computerId]);
  }

  deleteProduct(CartModel cartModel) async {
    var dbClient = await database;
    return await dbClient.delete(
      tableCartProduct,
      where: '$columnComputerId = ?',
      whereArgs: [cartModel.computerId],
    );
  }
}
