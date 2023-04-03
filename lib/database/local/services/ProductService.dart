import 'package:price_calculator_amul/database/local/models/ProductModel.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';

class ProductDatabase {
  static insert(Product product) async {
    final db = await openDatabase(databaseName);
    await db.insert(productMasterTable, product.toJson());
    return "Success";
  }

  static fetchAll() async {
    final db = await openDatabase(databaseName);
    final res =
        await db.rawQuery('Select * from $productMasterTable where status = 1');
    return res.map((e) => Product.fromJson(e)).toList();
  }

  static fetchbyId(int id) async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery(
        'Select * from $productMasterTable where prd_id = $id AND status = 1');
    return res.map((e) => Product.fromJson(e)).toList();
  }

  static fetchFavourite() async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery(
        'Select * from $productMasterTable where isFavourite = 1 AND status = 1');
    return res.map((e) => Product.fromJson(e)).toList();
  }

  static unFavourite(int id) async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery(
        'Update $productMasterTable set isFavourite = 0  where prd_id  = $id');
    return "Success";
  }

  static favourite(int id) async {
    final db = await openDatabase(databaseName);
    await db.rawQuery(
        'Update $productMasterTable set isFavourite = 1 where prd_id  = $id');
  }

  static fetchByGrpid(int id) async {
    final db = await openDatabase(databaseName);
    final res = await db
        .rawQuery('Select * from $productMasterTable where grp_id = $id');

    return res.map((e) => Product.fromJson(e)).toList();
  }

  static emptyCart() async {
    final db = await openDatabase(databaseName);
    await db.rawQuery('Update $productMasterTable set quantity = 1');
  }
}
