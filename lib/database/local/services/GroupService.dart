import 'package:price_calculator_amul/database/local/models/GroupModel.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';

class GroupDatabase {
  static insert(GroupModel group) async {
    final db = await openDatabase(databaseName);
    await db.insert(productGroupMaster, group.toJson());
    return "Success";
  }

  static fetchAll() async {
    final db = await openDatabase(databaseName);
    final res = await db.rawQuery('Select * from $productGroupMaster');
    print('check');
    print(res);
    return res.map((e) => GroupModel.fromJson(e)).toList();
  }
}
