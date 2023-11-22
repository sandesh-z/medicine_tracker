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
  Database? database;
  @override
  Future<bool> checkIfAvailable(
      {required String tableName,
      required List<String> columns,
      required String where,
      required List whereArgs}) {
    // TODO: implement checkIfAvailable
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future delete(
      {required String tableName, required Map<String, dynamic> values}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future deleteAll({required String tableName}) {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>>? getAllFrom({required String tableName}) {
    // TODO: implement getAllFrom
    throw UnimplementedError();
  }

  @override
  Future insert(
      {required String tableName, required Map<String, dynamic> values}) async {
    await database?.insert(tableName, values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  // TODO: implement isOpen
  bool get isOpen => throw UnimplementedError();

  @override
  Future open() async {
    try {
      database = await openDatabase(
          join(await getDatabasesPath(), "medicine_detail_database.db"),
          onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE medicine_details(id INTEGER PRIMARY KEY,medicine_name TEXT,frequency TEXT,schedule TEXT)');
      }, version: 1);
      print("success");
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
