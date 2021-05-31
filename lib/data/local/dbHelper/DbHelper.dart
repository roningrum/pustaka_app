import 'dart:ffi';

import 'package:pustaka_app/data/local/AntrianQuery.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;


class DbHelper {
  static DbHelper _dbHelper = DbHelper._singleton();

  factory DbHelper() {
    return _dbHelper;
  }

  //create table Antrian
  DbHelper._singleton();

  final tables = [AntrianQuery.CREATE_TABLE];

  //open db
  Future<Database> openDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(path.join(dbPath, 'pustaka.db'),
     onCreate: (db, version){
      tables.forEach((tables) async{
        await db.execute(tables).then((value) {
          print("berhasil buat db");
        }).catchError((error){
          print("gagal koneksi dan ${error.toString()}");
        });
      });
      print('Tabel dibuat');
     }, version: 1
    );
  }

  //insert to table
Future<void> insert(String table, Map<String, Object> data) async{
    openDb().then((db){
      db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.ignore);
    }).catchError((err){
      print("error $err");
    });
}

Future<List> getData(String tableName) async{
    final db = await openDb();
    var result = await db.query(tableName);
    return result.toList();
}
}
