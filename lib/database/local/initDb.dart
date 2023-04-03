import 'package:price_calculator_amul/database/local/models/GroupModel.dart';
import 'package:price_calculator_amul/database/local/models/ProductModel.dart';
import 'package:price_calculator_amul/database/local/queries.dart';
import 'package:price_calculator_amul/database/local/services/GroupService.dart';
import 'package:price_calculator_amul/database/local/services/ProductService.dart';
import 'package:price_calculator_amul/database/local/tables.dart';
import 'package:sqflite/sqflite.dart';

class InitDB {
  static final InitDB instance = InitDB._init();
  InitDB._init();
  // allPossibilitiesDatabase allpossibilitydb = allPossibilitiesDatabase();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB(databaseName);
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbpath = await getDatabasesPath();
    final path = "$dbpath/$dbName";
    print(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int i) async {
//---------------- Adding Tables ------------------------------
    List group = [
      ['AM023', 'Milk'],
      ['AM024', 'Dahi'],
      ['AM025', 'Buttermilk'],
    ];

    List<Product> products = [
      Product(
          grp_id: 1,
          prd_code: 'AmlGld500ml',
          prd_name: 'Amul Gold 500ml',
          prd_shortname: 'ગોલ્ડ  500ml',
          rate: 28,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_gold.jpeg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 1,
          prd_code: 'AmlGld1l',
          prd_name: 'Amul Gold 1l',
          prd_shortname: 'ગોલ્ડ  1l',
          rate: 56,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_gold.jpeg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 1,
          prd_code: 'AmlSkti500ml',
          prd_name: 'Amul Shakti 500ml',
          prd_shortname: 'શક્તિ 500ml',
          rate: 31,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_shakti.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 1,
          prd_code: 'AmlSkti1l',
          prd_name: 'Amul Shakti 1l',
          prd_shortname: 'શક્તિ 1l',
          rate: 62,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_shakti.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 1,
          prd_code: 'AmlMoti500ml',
          prd_name: 'Amul Moti 500ml',
          prd_shortname: 'મોતી  500ml',
          rate: 33,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_moti.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 1,
          prd_code: 'AmlMoti1l',
          prd_name: 'Amul Moti 1l',
          prd_shortname: 'મોતી  1l',
          rate: 66,
          quantity: 500,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_moti.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 2,
          prd_code: 'AmlDahi100g',
          prd_name: 'Amul Masti Dahi 100g',
          prd_shortname: 'દહીં 100g',
          rate: 12,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_dahi.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 2,
          prd_code: 'AmlDahi200g',
          prd_name: 'Amul Masti Dahi 200g',
          prd_shortname: 'દહીં 200g',
          rate: 21,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_dahi.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 2,
          prd_code: 'AmlDahi400g',
          prd_name: 'Amul Masti Dahi 400g',
          prd_shortname: 'દહીં 400g',
          rate: 38,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_dahi.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 2,
          prd_code: 'AmlDahi1kg',
          prd_name: 'Amul Masti Dahi 1kg ',
          prd_shortname: 'દહીં 1kg',
          rate: 78,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_dahi.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 3,
          prd_code: 'AmlBtrMlk100ml',
          prd_name: 'Amul Buttermilk 100ml',
          prd_shortname: 'છાસ 100ml',
          rate: 15,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_buttermilk.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 3,
          prd_code: 'AmlBtrMlk200ml',
          prd_name: 'Amul Buttermilk 200ml',
          prd_shortname: 'છાસ 200ml',
          rate: 26,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_buttermilk.jpg',
          status: 1,
          isFavourite: 0),
      Product(
          grp_id: 3,
          prd_code: 'AmlBtrMlk500ml',
          prd_name: 'Amul Buttermilk 500ml',
          prd_shortname: 'છાસ 500ml',
          rate: 56,
          quantity: 1,
          sequence: 1,
          unit_type: 1,
          prd_image: 'assets/amul_buttermilk.jpg',
          status: 1,
          isFavourite: 0),
    ];
    await db.execute(createTableforProductMaster);
    await db.execute(createTableforProductGroupMaster);
    for (int i = 0; i < group.length; i++) {
      await db.execute(
          'Insert into $productGroupMaster values(?,"${group[i][0]}","${group[i][1]}")');
    }
    for (int i = 0; i < products.length; i++) {
      await db.execute(
          'Insert into $productMasterTable values(?,${products[i].grp_id},"${products[i].prd_code}","${products[i].prd_name}","${products[i].prd_shortname}",${products[i].rate},${products[i].quantity},${products[i].sequence},${products[i].unit_type},"${products[i].prd_image}",${products[i].isFavourite},${products[i].status})');
    }
  }
}
