import 'dart:io';
import 'package:flutter_codigo5_sqflite_qr/models/license_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? _myDatabase;
  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> getDatabase() async {
    if (_myDatabase != null) {
      return _myDatabase;
    }
    _myDatabase = await initDB();
    return _myDatabase;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LicenseDB.db");
    return openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE LICENSES(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dni TEXT, url TEXT)");
    });
  }

  Future<List> getLicences() async {
    final db = await getDatabase();
    List res = await db!.query("LICENSES");
    return res;
  }

  Future<List<LicenseModel>> getLicenses2() async {
    final db = await getDatabase();
    List res = await db!.query("LICENSES");
    List<LicenseModel> licenses = [];
    // res.forEach((element) {
    //   licenses.add(LicenseModel.fromJson(element));
    // });
    licenses = res.map((e) => LicenseModel.fromJson(e)).toList();
    return licenses;
  }

  Future<int> insertLincese(LicenseModel model) async {
    final db = await getDatabase();
    int res = await db!.insert(
      "LICENSES",
      // {
      //   "name": model.name,
      //   "dni": model.dni,
      //   "url": model.url,
      // },
      model.toJson(),
    );
    return res;
  }
}
