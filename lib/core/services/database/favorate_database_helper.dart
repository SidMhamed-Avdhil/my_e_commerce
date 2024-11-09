import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/model/favorate_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavorateDatabaseHelper {
  FavorateDatabaseHelper._();
  static final FavorateDatabaseHelper db = FavorateDatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'FavorateProduct.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $tableFavorateProduct(
          $columnComputerId TEXT NOT NULL,
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnQuantity INTEGER NOT NULL,
          $columnPrice TEXT NOT NULL)
          ''');
    });
  }

  Future<List<FavorateModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableFavorateProduct);

    List<FavorateModel> list = maps.isNotEmpty
        ? maps.map((product) => FavorateModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(FavorateModel favorateModel) async {
    var dbClient = await database;

    await dbClient.insert(
      tableFavorateProduct,
      favorateModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  deleteProduct(FavorateModel favorateModel) async {
    var dbClient = await database;
    return await dbClient.delete(
      tableCartProduct,
      where: '$columnComputerId = ?',
      whereArgs: [favorateModel.computerId],
    );
  }
}
