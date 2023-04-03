import 'package:price_calculator_amul/database/local/tables.dart';

String createTableforProductGroupMaster =
    "Create table if not exists $productGroupMaster(grp_id INTEGER,grp_code TEXT ,grp_name TEXT,PRIMARY KEY(grp_id AUTOINCREMENT)) ";

String createTableforProductMaster =
    "Create table if not exists $productMasterTable(prd_id INTEGER , grp_id INTEGER,prd_code TEXT,prd_name TEXT, prd_shortname TEXT,rate INTEGER,quantity INTEGER,sequence INTEGER, unit_type INTEGER,prd_image TEXT,isFavourite INTEGER, status INTEGER,PRIMARY KEY(prd_id AUTOINCREMENT),FOREIGN KEY(grp_id) REFERENCES $productGroupMaster(grp_id))";
