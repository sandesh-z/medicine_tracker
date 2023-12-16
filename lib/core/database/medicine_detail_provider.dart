import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/database/datbase_constants/database_table_constants.dart';
import 'package:medicine_tracker/core/database/local_database_provider.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';

abstract class MedicineDetailsProvider {
  Future<void> insertMedicineDetailItem(MedicineDetails medicineDetails);
  Future<void> updateMedicineDetailItem(String value, int id);
  Future<void> delete(int id);
  Future<void> resetAllMedicineTakenFlags();
  Future<List<MedicineDetails>?> getAllMedicne();
}

@Singleton(as: MedicineDetailsProvider)
class MedicineProviderImpl implements MedicineDetailsProvider {
  final DBProvider provider;

  MedicineProviderImpl({required this.provider});

  @override
  Future insertMedicineDetailItem(MedicineDetails medicineDetails) async {
    await provider.open();

    await provider.insert(
      tableName: 'medicine_details',
      values: medicineDetails.toMap(),
    );
  }

  @override
  Future<List<MedicineDetails>?> getAllMedicne() async {
    if (!provider.isOpen) {
      await provider.open();
    }
    final List<Map<String, dynamic>>? maps =
        await provider.getAllFrom(tableName: 'medicine_details');
    if (maps == null) return [];
    debugPrint(maps.toList().toString());
    return List.generate(maps.length, (i) {
      return MedicineDetails(
        id: maps[i]['id'] as int,
        medicineName: maps[i]['medicine_name'] as String,
        frequency: maps[i]['frequency'] as int,
        schedule: maps[i]['schedule'] as String,
        allMedicineTakenList: maps[i]['all_medicine_taken'] as String,
      );
    });
  }

  @override
  Future updateMedicineDetailItem(String value, int id) async {
    if (!provider.isOpen) {
      await provider.open();
    }
    await provider.update(
        tableName: MedicineDetailItems.medicineDetailsTable,
        columnName: MedicineDetailItems.allMedicineTaken,
        values: value,
        id: id);
  }

  @override
  Future resetAllMedicineTakenFlags() async {
    if (!provider.isOpen) {
      await provider.open();
    }
    final List<Map<String, dynamic>>? maps =
        await provider.getAllFrom(tableName: 'medicine_details');
    if (maps == null) return;

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
      if (!(list[i].allMedicineTakenList?.contains('true') ?? false)) {
        continue;
      }
      await provider.update(
          tableName: MedicineDetailItems.medicineDetailsTable,
          columnName: MedicineDetailItems.allMedicineTaken,
          values:
              list[i].allMedicineTakenList?.replaceAll("true", "false") ?? "",
          id: list[i].id ?? 0);
    }
  }

  @override
  Future delete(int id) async {
    await provider.delete(
        tableName: MedicineDetailItems.medicineDetailsTable,
        values: {"id": id});
  }
}
