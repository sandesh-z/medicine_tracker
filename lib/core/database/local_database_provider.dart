import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/database/datbase_constants/database_table_constants.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
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
  Future update({
    required String tableName,
    required String columnName,
    required String values,
    required int id,
  });

  Future delete({
    required String tableName,
    required Map<String, dynamic> values,
  });

  Future deleteAll({
    required String tableName,
  });

  Future<List<Map<String, dynamic>>>? getAllFrom({required String tableName});
  Future<void> resetAllMedicineTakenFlags();
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
          return db.execute(_createMedicineDetailsTable());
        },
        version: _version,
      );
      debugPrint("db open success");
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future update(
      {required String tableName,
      required String columnName,
      required String values,
      required int id}) async {
    return await _database?.update(tableName, {columnName: values},
        where: '${"id"} = ?', whereArgs: [id]);
  }

  @override
  Future resetAllMedicineTakenFlags() async {
    //open db
    try {
      _database = await openDatabase(
        join(await getDatabasesPath(), "medicine_detail_database.db"),
        onCreate: (db, version) {
          return db.execute(_createMedicineDetailsTable());
        },
        version: _version,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    final result = await _database
        ?.rawQuery("SELECT * from ${MedicineDetailItems.medicineDetails}");
    final List<Map<String, dynamic>>? maps = result;

    if (maps == null) {
      return;
    }

    List<MedicineDetails> list = List.generate(maps.length, (i) {
      return MedicineDetails(
        id: maps[i]['id'] as int,
        medicineName: maps[i]['medicine_name'] as String,
        frequency: maps[i]['frequency'] as int,
        schedule: maps[i]['schedule'] as String,
        allMedicineTakenList: maps[i]['all_medicine_taken'] as String,
      );
    });
    for (int i = 0; i < list.length; i++) {
      //skip if no medicine taken
      if (!(list[i].allMedicineTakenList?.contains('true') ?? false)) {
        continue;
      }
      await _database?.update(
          MedicineDetailItems.medicineDetails,
          {
            MedicineDetailItems.allMedicineTaken:
                list[i].allMedicineTakenList?.replaceAll("true", "false") ?? ""
          },
          where: '${"id"} = ?',
          whereArgs: [list[i].id ?? 0],
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  String _createMedicineDetailsTable() {
    return '''
    CREATE TABLE IF NOT EXISTS ${MedicineDetailItems.medicineDetails}
     ( 
      ${MedicineDetailItems.medicineDetailsId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${MedicineDetailItems.medicineName} TEXT,
      ${MedicineDetailItems.medicineReminderFrequency} INTEGER,
      ${MedicineDetailItems.medicineTakingSchedule} TEXT,
      ${MedicineDetailItems.allMedicineTaken} TEXT
      
      )
    ''';
  }
}
