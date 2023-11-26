import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/database/local_database_provider.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';

abstract class MedicineDetailsProvider {
  Future insertMedicineDetailItem(MedicineDetails medicineDetails);
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
    print(maps.toList());
    return List.generate(maps.length, (i) {
      return MedicineDetails(
        id: maps[i]['id'] as int,
        medicineName: maps[i]['medicine_name'] as String,
        frequency: maps[i]['frequency'] as int,
        schedule: maps[i]['schedule'] as String,
      );
    });
  }
}
