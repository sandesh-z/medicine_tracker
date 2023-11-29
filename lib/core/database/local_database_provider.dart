import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DBProvider {
  bool get isOpen;
  Future open();
  Future<void> close();

  Future insert({
    required String tableName,
    required Map<String, dynamic> values,
  });

  Future<bool> checkIfAvailable({
    required String tableName,
    required List<String> columns,
    required String where,
    required List<dynamic> whereArgs,
  });

  Future delete({
    required String tableName,
    required Map<String, dynamic> values,
  });

  Future deleteAll({
    required String tableName,
  });

  Future<List<Map<String, dynamic>>>? getAllFrom({required String tableName});
}

@Singleton(as: DBProvider)
class DBProviderImpl implements DBProvider {
  static const int _version = 2;
  Database? _database;

  @override
  Future<bool> checkIfAvailable(
      {required String tableName,
      required List<String> columns,
      required String where,
      required List whereArgs}) async {
    final tableData = await _database?.query(
      tableName,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
    );

    if (tableData?.isNotEmpty ?? false) {
      return true;
    }

    return false;
  }

  @override
  Future<void> close() async => _database?.close();

  @override
  Future delete(
      {required String tableName, required Map<String, dynamic> values}) async {
    await _database
        ?.delete(tableName, where: '${"id"} = ?', whereArgs: [values["id"]]);
  }

  @override
  Future deleteAll({required String tableName}) async {
    await _database?.delete(
      tableName,
    );
  }

  @override
  Future<List<Map<String, dynamic>>>? getAllFrom({required String tableName}) =>
      _database?.rawQuery("SELECT * from $tableName");

  @override
  Future insert(
      {required String tableName, required Map<String, dynamic> values}) async {
    await _database?.insert(tableName, values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  bool get isOpen => _database?.isOpen ?? false;

  @override
  Future open() async {
    try {
      _database = await openDatabase(
        join(await getDatabasesPath(), "medicine_detail_database.db"),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE medicine_details(id INTEGER PRIMARY KEY AUTOINCREMENT,medicine_name TEXT,frequency INTEGER,schedule TEXT,all_medicine_taken TEXT)');
        },
        version: _version,
      );
      debugPrint("success");
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
